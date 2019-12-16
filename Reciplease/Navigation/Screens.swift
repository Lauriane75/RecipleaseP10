//
//  Screens.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//


import UIKit

final class Screens {
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))
}

// MARK : - Main

protocol SearchViewControllerDelegate: class {
}

extension Screens {
    
    func createSearchViewController(delegate: HomeViewModelDelegate?, alertDelegate: AlertDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! HomeViewController
        let viewModel = HomeViewModel(delegate: delegate, alertDelegate: alertDelegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Child

protocol RecipesViewControllerDelegate: class {
}

protocol RecipeDetailViewControllerDelegate: class {
}

enum type {
    case foundRecipes
    case favoriteRecipes
}

extension Screens {
    func createRecipesViewController(ingredientSelected: String, delegate: RecipesViewModelDelegate?, alertDelegate: AlertDelegate?, tableViewtype: type) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesViewController") as! RecipesViewController
        
        switch tableViewtype {
        case .foundRecipes :
            let network = NetworkRequest()
            let repository = RecipesRepository(requestType: .network, network: network)
            let viewModel = RecipesViewModel(delegate: delegate, alertDelegate: alertDelegate, repository: repository, ingredients: ingredientSelected)
            viewController.viewModel = viewModel
        case .favoriteRecipes :
            let network = NetworkRequest()
            let repository = RecipesRepository(requestType: .persistence, network: network)
            let viewModel = RecipesViewModel(delegate: delegate, alertDelegate: alertDelegate, repository: repository, ingredients: ingredientSelected)
            viewController.viewModel = viewModel
        }
        return viewController
    }
}

extension Screens {
    func createRecipeDetailViewController(recipeSelected: RecipeItem, alertDelegate: AlertDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipeDetailViewController") as! RecipeDetailViewController
        let repository = RecipeDetailRepository()
        let viewModel = RecipeDetailViewModel(repository: repository, recipe: recipeSelected, alertDelegate: alertDelegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Alert

extension Screens {
    func createAlertView(for type: AlertType) -> UIAlertController? {
        let alert = Alert(type: type)
        let alertViewController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .actionSheet)
        let yesButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertViewController.addAction(yesButton)
        return alertViewController
    }
}

