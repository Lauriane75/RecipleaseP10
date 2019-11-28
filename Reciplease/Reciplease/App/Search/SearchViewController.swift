//
//  SearchViewController.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!

    @IBOutlet weak var clearButton: UIButton!

    @IBOutlet weak var ingredientListLabel: UILabel!
    
    @IBOutlet weak var searchForRecipesButton: UIButton!
    
    @IBOutlet weak var ingredientListTableView: UITableView!
    
    var viewModel: SearchViewModel!
    
    private lazy var searchDataSource = SearchDataSource()
    
    weak var delegate: SearchViewControllerDelegate?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        ingredientListTableView.dataSource = searchDataSource
        bind(to: viewModel)
        viewModel.viewDidLoad()
        
        elementCustom()

    }
    
    // MARK: - Private Functions

    
    private func bind(to viewModel: SearchViewModel) {
        viewModel.titleLabel = { [weak self] text in
            self?.titleLabel.text = text
        }
        viewModel.addButton = { [weak self] text in
            self?.addButton.setTitle(text, for: .normal)
        }
        viewModel.placeHolderTextField = { [weak self] text in
            self?.searchTextField.placeholder = text
        }
        viewModel.ingredientTextField = { [weak self] text in
            self?.searchTextField.text = text
        }
        viewModel.ingredientListLabel = { [weak self] text in
            self?.ingredientListLabel.text = text
        }
        viewModel.clearButton = { [weak self] text in
            self?.clearButton.setTitle(text, for: .normal)
        }
        viewModel.searchButtonIsHidden = { [weak self] state in
            self?.searchForRecipesButton.isHidden = state
        }
        viewModel.searchButton = { [weak self] text in
            self?.searchForRecipesButton.setTitle(text, for: .normal)
        }
        viewModel.ingredients = { [weak self] item in
            DispatchQueue.main.async {
                self?.searchDataSource.update(with: item)
                self?.ingredientListTableView.reloadData()
            }
        }
         
    }
    
    // MARK: - Private Files
    
    fileprivate func elementCustom() {
           addButton.layer.cornerRadius = 15
           clearButton.layer.cornerRadius = 15
           searchForRecipesButton.layer.cornerRadius = 20
       }
    
}
