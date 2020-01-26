//
//  FavoriteCoordinator.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//
import UIKit

final class FavoriteCoordinator {
    
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
        showFavoriteRecipes()
    }
    
    private func showFavoriteRecipes() {
        let viewController = screens.createRecipesViewController(ingredientSelected: "", delegate: self, tableViewtype: .favoriteRecipes)
        presenter.viewControllers = [viewController]
    }
    
    private func showRecipeDetailFromFavorite(recipe: RecipeItem) {
        let viewController = screens.createRecipeDetailViewController(recipeSelected: recipe)
        presenter.pushViewController(viewController, animated: true)
    }
    
    private func showAlert(for type: AlertType) {
        let alert = screens.createAlertView(for: type)
        presenter.visibleViewController?.present(alert, animated: true, completion: nil)
    }
}

extension FavoriteCoordinator: RecipesViewModelDelegate {
    
    func displayRecipesAlert(for type: AlertType) {
        showAlert(for: type)
    }
    
    func selectRecipe(recipe: RecipeItem) {
        showRecipeDetailFromFavorite(recipe: recipe)
    }
}

