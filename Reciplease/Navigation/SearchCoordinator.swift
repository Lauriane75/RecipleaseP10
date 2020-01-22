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
    
    var creationsArray: CreationItem? = nil
    
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
    
    private func showCreateMyRecipe() {
        let viewController = screens.createSavingMyCreationViewController(delegate: self)
        presenter.show(viewController, sender: nil)
    }
    
    private func showCreationDetail(creation: CreationItem) {
        let viewController = screens.createCreationDetailViewController(creationSaved: creation, delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }
    
    private func showCreationsListFromButton(creation: CreationItem) {
        let viewController = screens.createCreationsListViewController(delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }
    
    private func update (updatedCreations: CreationItem?) {
        self.creationsArray = updatedCreations
    }
    
}

extension SearchCoordinator: SearchHomeViewModelDelegate {
    func showCreateMyRecipeView() {
        showCreateMyRecipe()
    }
    
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

extension SearchCoordinator: SavingCreationViewModelDelegate {

    func didPressSaveButton(creation: CreationItem) {
        showCreationDetail(creation: creation)
    }
    
    func displayAlert(for type: AlertType) {
        showAlert(for: type)
    }
}

extension SearchCoordinator: CreationsViewModelDelegate {
    
    func didPressCreationsListButton(creation: CreationItem) {
        showCreationsListFromButton(creation: creation)
    }
    
    func selectCreation(creation: CreationItem) {
        showCreationDetail(creation: creation)
    }
}

extension SearchCoordinator: CreationsListViewModelDelegate {
    func openListFromItem(creations: [CreationItem]) {
        
    }
    
    func didPressCreationsListItem(creation: CreationItem) {
        showCreationsListFromButton(creation: creation)
    }
}
