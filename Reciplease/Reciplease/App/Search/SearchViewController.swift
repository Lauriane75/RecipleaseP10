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
    
    weak var delegate: SearchViewControllerDelegate?

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    private func bind(to viewModel: SearchViewModel) {
         
    }
    
}
