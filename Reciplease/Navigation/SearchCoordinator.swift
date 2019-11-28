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
        let viewController = screens.createSearchViewController(delegate: self, alertDelegate: self as? AlertDelegate)
        presenter.viewControllers = [viewController]
    }
    
    private func showRecipes(ingredient: String) {
        
    }
    
    
}

extension SearchCoordinator: SearchViewModelDelegate {
    
    func didSelectIngredient(ingredient: String) {
//        showRecipes(ingredient: ingredients)
    }
    func errorNoRecipeFound(for type: AlertType) {
//        showAlert(for: type)
    }

}
