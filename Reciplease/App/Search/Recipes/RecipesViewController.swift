//
//  FavoriteViewController.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var recipesTableView: UITableView!
        
    // MARK: - Properties
    
    var viewModel: RecipesViewModel!
           
    private lazy var recipeDataSource = RecipesDataSource()
    
    // MARK: - ViewLifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // problem
        navigationBar()
        
        recipesTableView.delegate = recipeDataSource
        recipesTableView.dataSource = recipeDataSource

        bind(to: viewModel)
        bind(to: recipeDataSource)
    }
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: RecipesViewModel) {
        viewModel.activityIndicatorIsLoading = { [weak self] loadingState in
            switch loadingState {
            case true:
                self?.recipesTableView.isHidden = true
                self?.activityIndicator.startAnimating()
            case false:
                self?.recipesTableView.isHidden = false
                self?.activityIndicator.stopAnimating()
            }
        }
        viewModel.recipesDisplayed = { [weak self] recipes in
            DispatchQueue.main.async {
                self?.recipeDataSource.updateCell(updatedRecipes: recipes)
                self?.recipesTableView.reloadData()
            }
        }
    }
    
    private func bind(to source: RecipesDataSource) {
        source.selectedRecipe = viewModel.didSelectRecipe
    }

    private func navigationBar() {

    let titleColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
    navigationController?.navigationBar.titleTextAttributes = titleColor
//    navigationItem.title = Accessibility.RecipesView.title
    self.navigationController?.navigationBar.tintColor = .white
    self.navigationController?.navigationBar.barTintColor = .orange
    }
}



 
