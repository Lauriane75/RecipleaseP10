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
        showFavorite()
    }

    private func showFavorite() {
       
        let viewController = screens.createFavoriteViewController(delegate: self)
        presenter.viewControllers = [viewController]
    }
    
}

extension FavoriteCoordinator: FavoriteViewModelDelegate {
    
    func selectRecipe() {

    }
}

extension FavoriteCoordinator: RecipeDetailViewModelDelegate {
    
    func didPressRecipeDetailView() {

    }

}

    






