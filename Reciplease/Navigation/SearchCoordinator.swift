//
//  SearchCoordinator.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class SearchCoordinator {
    
    // MARK: - Properties
    
    private let presenter: UINavigationController
    
    private let screens: Screens
    
    // MARK: - Initializer
    
    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screens = screens
    }
    
    // MARK: - Coodinator
    
    func start() {
        showHome()
    }
    
    private func showHome() {
        let viewController = screens.createSearchViewController(delegate: self)
        presenter.viewControllers = [viewController]
    }
    
    private func showRecipes(ingredients: String) {
        let viewController = screens.createRecipesViewController(ingredientSelected: ingredients, delegate: self, tableViewtype: .foundRecipes)
        print("ingrédient : \(ingredients)")
        presenter.pushViewController(viewController, animated: true)
    }
    
    private func showAlert(for type: AlertType) {
        let alert = screens.createAlertView(for: type)
        presenter.visibleViewController?.present(alert, animated: true, completion: nil)
    }
    
    private func showRecipesDetail(recipe: RecipeItem) {
        let viewController = screens.createRecipeDetailViewController(recipeSelected: recipe)
        presenter.pushViewController(viewController, animated: true)
    }
}

extension SearchCoordinator: HomeViewModelDelegate {
    
    func didSelectIngredient(ingredient: String) {
        showRecipes(ingredients: ingredient)
    }
    func displayHomeAlert(for type: AlertType) {
        showAlert(for: type)
    }
}

extension SearchCoordinator: RecipesViewModelDelegate {
    func selectRecipe(recipe: RecipeItem) {
        showRecipesDetail(recipe: recipe)
    }
    
    func displayRecipesAlert(for type: AlertType) {
        showAlert(for: type)
    }
}

