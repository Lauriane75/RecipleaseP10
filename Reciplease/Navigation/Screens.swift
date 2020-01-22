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

extension Screens {
    
    func createSearchViewController(delegate: HomeViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! HomeViewController
        let viewModel = HomeViewModel(delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Child

enum type {
    case foundRecipes
    case favoriteRecipes
}

extension Screens {
    func createRecipesViewController(ingredientSelected: String, delegate: RecipesViewModelDelegate?, tableViewtype: type) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesViewController") as! RecipesViewController
        
        switch tableViewtype {
        case .foundRecipes :
            let network = NetworkRequest()
            let repository = RecipesRepository(requestType: .network, network: network)
            let viewModel = RecipesViewModel(delegate: delegate, repository: repository, ingredients: ingredientSelected)
            viewController.viewModel = viewModel
            viewController.title = Accessibility.RecipesView.title
        case .favoriteRecipes :
            let network = NetworkRequest()
            let repository = RecipesRepository(requestType: .persistence, network: network)
            let viewModel = RecipesViewModel(delegate: delegate, repository: repository, ingredients: ingredientSelected)
            viewController.viewModel = viewModel
            viewController.title = Accessibility.FavoriteView.title
        }
        return viewController
    }
}

extension Screens {
    func createRecipeDetailViewController(recipeSelected: RecipeItem) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipeDetailViewController") as! RecipeDetailViewController
        let repository = RecipeDetailRepository()
        let viewModel = RecipeDetailViewModel(repository: repository, recipe: recipeSelected)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createSavingMyCreationViewController(delegate: SavingCreationViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "SavingMyCreationViewController") as! SavingMyCreationViewController
        let repository = CreationRecipeRepository()
        let viewModel = SavingCreationViewModel(delegate: delegate, repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createCreationDetailViewController(creationSaved: CreationItem, delegate: CreationsViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "CreationDetailViewController") as! CreationDetailViewController
        let repository = CreationRecipeRepository()
        let viewModel = CreationDetailViewModel(repository: repository, delegate: delegate, creation: creationSaved)
        viewController.viewModel = viewModel
        viewController.title = "My Creation"
        return viewController
    }
}


extension Screens {
    func createCreationsListViewController(creationSaved: CreationItem, delegate: CreationsListViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "CreationsListViewController") as! CreationsListViewController
        let repository = CreationRecipeRepository()
        let viewModel = CreationsListViewModel(repository: repository, delegate: delegate, creation: creationSaved)
        viewController.viewModel = viewModel
        viewController.title = "Creations"

        return viewController
    }
}


// MARK: - Alert

extension Screens {
    func createAlertView(for type: AlertType) -> UIAlertController {
        let alert = Alert(type: type)
        let alertViewController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        return alertViewController
    }
}

