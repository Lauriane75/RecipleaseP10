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
    func displayRecipesAlert(for type: AlertType)
}

final class RecipesViewModel {
    
    // MARK: - Properties
    
    private weak var delegate: RecipesViewModelDelegate?
    
    private var ingredients: String
    
    private var repository: RecipesRepositoryType
    
    let route = Route()
    
    private var recipes: [RecipeItem] = [] {
        didSet {
            if recipes != [] {
                recipesDisplayed?(recipes)
            } else {
                delegate?.displayRecipesAlert(for: .errorNoRecipe)
            }
        }
    }
    
    // MARK: - Initializer
    
    init(delegate: RecipesViewModelDelegate?, repository: RecipesRepositoryType, ingredients: String) {
        self.delegate = delegate
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
                DispatchQueue.main.async {
                    self?.delegate?.displayRecipesAlert(for: .errorService)
                }
            }
            }, error: { [weak self] alert in
                self?.delegate?.displayRecipesAlert(for: .errorService)
                return
        })
        recipesDisplayed?(recipes)
    }
    
    func didSelectRecipe(recipe: RecipeItem) {
        delegate?.selectRecipe(recipe: recipe)
    }
}
