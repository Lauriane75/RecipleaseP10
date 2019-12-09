//
//  FavoriteCoordinator.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class FavoriteRecipesCoordinator {

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
        showFavoriteRecipesView()
    }

    private func showFavoriteRecipesView() {
        print("tableViewtype: Favorite")
        let viewController = screens.createRecipesViewController(ingredientSelected: "", delegate: self, alertDelegate: self as? AlertDelegate, tableViewtype: .favoriteRecipes)
        presenter.viewControllers = [viewController]
    }
}

extension FavoriteRecipesCoordinator: RecipesViewModelDelegate {
    func error(for type: AlertType) {
        
    }
    
    func selectRecipe(recipe: RecipeItem) {
        
    }
}

extension FavoriteRecipesCoordinator: RecipeDetailViewModelDelegate {
    
    func didPressRecipeDetailView() {

    }
}

    






