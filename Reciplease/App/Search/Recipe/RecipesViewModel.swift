//
//  FavoriteViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol RecipesViewModelDelegate: class {
    func selectRecipe(recipe: RecipeItem)
    func error(for type: AlertType)
}

final class RecipesViewModel {
    
    // MARK: - Properties
    
    private weak var delegate: RecipesViewModelDelegate?
    
    private weak var alertDelegate: AlertDelegate?
    
    private var ingredients: String
    
    private var repository: RecipeRepositoryType
        
    let route = Route()
    
    private var recipes: [RecipeItem] = [] {
        didSet {
            if recipes != [] {
                recipesDisplayed?(recipes)
            } else {
                alertDelegate?.displayAlert(type: .errorNoRecipeFound)
            }
        }
    }
    
    // MARK: - Initializer
    
    init(delegate: RecipesViewModelDelegate?, alertDelegate: AlertDelegate?, repository: RecipeRepositoryType, ingredients: String) {
        self.delegate = delegate
        self.alertDelegate = alertDelegate
        self.repository = repository
        self.ingredients = ingredients
    }
    
    // MARK: - Output
    
    var recipesDisplayed: (([RecipeItem]) -> Void)?
    
    var activityIndicatorIsLoading: ((Bool) -> Void)?
        
    // MARK: - Input
    
    func viewWillAppear() {
        activityIndicatorIsLoading?(true)
        guard let url = route.getURL(ingredients: ingredients) else { return }
        repository.getRecipes(url: url, success: { [weak self] recipes in
            
            switch recipes {
            case .success(value: let
                recipeArray):
                self?.recipes = recipeArray
                self?.activityIndicatorIsLoading?(false)
            case .error:
                self?.alertDelegate?.displayAlert(type: .errorNoService)
            }
            }, onError: { [weak self] error in
                self?.alertDelegate?.displayAlert(type: .errorNoService)
                return
        })
        recipesDisplayed?(recipes)
    }
    
    func didSelectRecipe(recipe: RecipeItem) {
        delegate?.selectRecipe(recipe: recipe)
    }
    
}
