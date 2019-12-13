//
//  RecipeDetailViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
import UIKit

protocol RecipeDetailViewModelDelegate: class {
    func didPressRecipeDetailView()
}

final class RecipeDetailViewModel {
    
    private var repository: RecipeDetailRepositoryType
    
    private var recipe: RecipeItem
    
    private weak var alertDelegate: AlertDelegate?
    
    private weak var delegate: RecipeDetailViewModelDelegate?
    
    private var starRate = 0
    
    // MARK: - Initializer
    
    init(delegate: RecipeDetailViewModelDelegate?, repository: RecipeDetailRepositoryType, recipe: RecipeItem, alertDelegate: AlertDelegate?) {
        self.delegate = delegate
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
        
        repository.verifyingFavoriteState(recipeName: recipe.name) {
            (state) in
            self.favoriteState?(state)
        }
        
        recipeDisplayed?(recipe)
        setUpTimeLabel()
        setUpYieldLabel()
        setUpDietLabel()
        
        image?("\(recipe.imageName)")
        
        nameRecipeButton?("\(recipe.name)")
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
    
    func didOpenSafariButton() {
        if let url = URL(string: recipe.url) {
            UIApplication.shared.open(url)
        }
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
    
    
    func setUpDietLabel() {
        var diet = editingDietLabels()
        if diet == "" {
            diet = "Food"
        }
        dietLabel?("\(diet)")
    }
    
    /// To remove '[]'
    func editingDietLabels() -> String {
        let first = "\(recipe.dietLabels)".dropFirst(2)
        let last = first.dropLast(2)
        
        return String(last)
    }
}
