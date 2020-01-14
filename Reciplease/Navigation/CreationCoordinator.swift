//
//  CreationCoordinator.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 12/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class CreationCoordinator {
    
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
        showCreations()
    }
    
    private func showCreations() {
        let viewController = screens.createCreations()
        presenter.viewControllers = [viewController]
    }
    
    private func showAlert(for type: AlertType) {
        let alert = screens.createAlertView(for: type)
        presenter.visibleViewController?.present(alert, animated: true, completion: nil)
    }
}

//extension CreationCoordinator: CreationViewModelDelegate {
//    func displayRecipesAlert(for type: AlertType) {
//           showAlert(for: type)
//    }
//
//    func selectRecipe(recipe: RecipeItem) {
//        showRecipeDetailFromFavorite(recipe: recipe)
//    }
//}


