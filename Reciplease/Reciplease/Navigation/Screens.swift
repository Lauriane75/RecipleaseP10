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

    let context: Context

    init(context: Context) {
        self.context = context
    }
}

// MARK : - Main

protocol SearchViewControllerDelegate: class {
}

extension Screens {

    func createMainViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let viewModel = SearchViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Child

protocol FavoriteViewControllerDelegate: class {
}

protocol RecipeDetailViewControllerDelegate: class {
}


extension Screens {
    func createFavoriteViewController(delegate: FavoriteViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
        let viewModel = FavoriteViewModel(delegate: delegate!)
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

