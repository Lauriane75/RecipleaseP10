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

    func createSearchViewController(delegate: SearchViewModelDelegate?, alertDelegate: AlertDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let viewModel = SearchViewModel(delegate: delegate, alertDelegate: alertDelegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Child

protocol FavoriteViewControllerDelegate: class {
}

protocol ResultRecipesViewControllerDelegate: class {
}

protocol RecipeDetailViewControllerDelegate: class {
}

extension Screens {
    func createResultRecipesViewController(ingredientSelected: String, delegate: ResultRecipesViewModelDelegate?, alertDelegate: AlertDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "ResultRecipesViewController") as! ResultRecipesViewController
        let viewModel = ResultRecipesViewModel(delegate: delegate!, alertDelegate: alertDelegate)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createRecipeDetailViewController(delegate: RecipeDetailViewModelDelegate?) -> UIViewController {
           let viewController = storyboard.instantiateViewController(withIdentifier: "RecipeDetailViewController") as! RecipeDetailViewController
           let viewModel = RecipeDetailViewModel(delegate: delegate)
           viewController.viewModel = viewModel
           return viewController
    }
}


extension Screens {
    func createFavoriteViewController(delegate: FavoriteViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
       let viewModel = FavoriteViewModel(delegate: delegate!)
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

