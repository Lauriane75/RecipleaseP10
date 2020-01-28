//
//  RecipeDetailViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol RecipeDetailViewModelDelegate: class {
    func displayAlert(for type: AlertType)
}

final class RecipeDetailViewModel {
    
    private var repository: RecipeDetailRepositoryType
    
    private var recipe: RecipeItem
    
    private var delegate: RecipeDetailViewModelDelegate?
    
    // MARK: - Initializer
    
    init(repository: RecipeDetailRepositoryType, recipe: RecipeItem) {
        self.repository = repository
        self.recipe = recipe
    }
    
    // MARK: - Output
    
    var recipeDisplayed: ((RecipeItem) -> Void)?
    var image: ((String) -> Void)?
    var timeLabel: ((String) -> Void)?
    var categoryLabel: ((String) -> Void)?
    var yieldLabel: ((String) -> Void)?
    var nameRecipeButton: ((String) -> Void)?
    var favoriteState: ((Bool) -> Void)?
    var favoriteImageState: ((String) -> Void)?
    
    var navBarTitle: ((String) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        navBarTitle?("Detail Recipes")
        
        recipeDisplayed?(recipe)
        image?("\(recipe.imageName)")
        setUpTime()
        setUpCategory()
        setUpYield()
        nameRecipeButton?("\(recipe.name)")
        
        self.repository.verifyingFavoriteState(recipeName: self.recipe.name) {
            (state) in
            self.favoriteState?(state)
            if state == false {
                favoriteImageState?("star")
            }
            else {
                favoriteImageState?("star.fill")
            }
        }
    }
    
    func didPressSelectFavoriteRecipe() {
        repository.verifyingFavoriteState(recipeName: recipe.name) { (state) in
            switch state {
            case true:
                repository.didPressRemoveFavoriteRecipe(recipeName: recipe.name)
                favoriteState?(false)
                
                print("state not favorite")
                favoriteImageState?("star")
                
            case false:
                repository.didPressSelectFavoriteRecipe(recipe: recipe, image: "star.fill")
                favoriteState?(true)
                
                print("state favorite")
                favoriteImageState?("star.fill")
            }
        }
    }
    
    func didPressSafariButton() {
        guard URL(string: recipe.url) != nil else {
            self.delegate?.displayAlert(for: .errorNoRecipe)
            return
        }
    }
    
    func returnUrl() -> URL {
        return URL(string: recipe.url)!
    }
    
    // MARK: - Private Functions
    
    fileprivate func setUpYield() {
        if recipe.yield == 0 {
            let defaultValue = 2
            yieldLabel?("\(defaultValue)")
        } else {
            yieldLabel?("\(recipe.yield)")
        }
    }
    
    fileprivate func setUpTime() {
        if recipe.time == 0 {
            let defaultValue = 30
            timeLabel?("\(defaultValue) min")
        } else {
            timeLabel?("\(recipe.time) min")
        }
    }
    
    fileprivate func setUpCategory() {
        var diet = editingDietLabels()
        if diet == "" {
            diet = "Low-Fat"
        }
        categoryLabel?("\(diet)")
    }
    
    /// To remove '[]'
    fileprivate func editingDietLabels() -> String {
        let first = "\(recipe.category)".dropFirst(2)
        let last = first.dropLast(2)
        
        return String(last)
    }
}
