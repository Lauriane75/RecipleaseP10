//
//  RecipeDetailViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class RecipeDetailViewModel {
    
    private var repository: RecipeDetailRepositoryType
    
    private var recipe: RecipeItem
    
    private weak var alertDelegate: AlertDelegate?
    
    private var starRate = 0
    
    // MARK: - Initializer
    
    init(repository: RecipeDetailRepositoryType, recipe: RecipeItem, alertDelegate: AlertDelegate?) {
        self.repository = repository
        self.recipe = recipe
        self.alertDelegate = alertDelegate
    }
    
    // MARK: - Output
    
    var recipeDisplayed: ((RecipeItem) -> Void)?
    var image: ((String) -> Void)?
    var timeLabel: ((String) -> Void)?
    var dietLabel: ((String) -> Void)?
    var yieldLabel: ((String) -> Void)?
    var nameRecipeButton: ((String) -> Void)?
    var favoriteState: ((Bool) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        
        recipeDisplayed?(recipe)
        image?("\(recipe.imageName)")
        setUpTimeLabel()
        setUpDietLabel()
        setUpYieldLabel()
        nameRecipeButton?("\(recipe.name)")
        
        self.repository.verifyingFavoriteState(recipeName: self.recipe.name) {
            (state) in
            self.favoriteState?(state)
        }
        
    }
    
    func didPressSelectFavoriteRecipe() {
        repository.verifyingFavoriteState(recipeName: recipe.name) { (state) in
            switch state {
            case true:
                repository.didPressRemoveFavoriteRecipe(recipeName: recipe.name)
                favoriteState?(false)
                print("state not favorite")
            case false:
                repository.didPressSelectFavoriteRecipe(recipe: recipe)
                favoriteState?(true)
                print("state favorite")
            }
        }
    }
    
    func didPPressSafariButton() {
        guard let url = URL(string: recipe.url) else {
            alertDelegate?.displayAlert(type: .errorNoService)
            return
        }
        UIApplication.shared.open(url)
    }
    
    // MARK: - Private Functions
    
    fileprivate func setUpYieldLabel() {
        if recipe.yield == 0 {
            let defaultValue = 2
            yieldLabel?("\(defaultValue)")
        } else {
            yieldLabel?("\(recipe.yield)")
        }
    }
    
    fileprivate func setUpTimeLabel() {
        if recipe.time == 0 {
            let defaultValue = 30
            timeLabel?("\(defaultValue) min")
        } else {
            timeLabel?("\(recipe.time) min")
        }
    }
    
    
    fileprivate func setUpDietLabel() {
        var diet = editingDietLabels()
        if diet == "" {
            diet = "Low-Fat"
        }
        dietLabel?("\(diet)")
    }
    
    /// To remove '[]'
    fileprivate func editingDietLabels() -> String {
        let first = "\(recipe.dietLabels)".dropFirst(2)
        let last = first.dropLast(2)
        
        return String(last)
    }
}
