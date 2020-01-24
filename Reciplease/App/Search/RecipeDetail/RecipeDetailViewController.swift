//
//  RecipeDetailViewController.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var bookMarkedLabel: UILabel!
    
    @IBOutlet weak var servingsLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var getDirectionButton: UIButton!
    
    var viewModel: RecipeDetailViewModel!
    
    private lazy var recipeDetailDataSource = RecipeDetailDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
        
        self.tableView.dataSource = recipeDetailDataSource
        
        elementsCustom()
        
        navigationBar()
    }
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: RecipeDetailViewModel) {
        
        viewModel.recipeDisplayed = { [weak self] recipe in
            self?.recipeDetailDataSource.update(with: recipe)
            self?.tableView.reloadData()
        }
        viewModel.image = { [weak self] url in
            self?.imageView.download(url)
        }
        viewModel.categoryLabel = { [weak self] text in
            self?.bookMarkedLabel.text = text
        }
        viewModel.nameRecipeButton = { [weak self] text in
            self?.getDirectionButton.setTitle(text, for: .normal)
        }
        viewModel.yieldLabel = { [weak self] text in
            self?.servingsLabel.text = text
        }
        viewModel.timeLabel = { [weak self] text in
            self?.timeLabel.text = text
        }
        viewModel.favoriteImageState = { [weak self] text in
            self?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: text), style: .done, target: self, action: #selector(self!.didPressSelectFavoriteRecipe))
        }
    }

    // MARK: - View actions

    @IBAction func didPressNameRecipeButton(_ sender: Any) {
        viewModel.didPressSafariButton()
        let url = viewModel.returnUrl()
        UIApplication.shared.open(url)
    }

    @objc func didPressSelectFavoriteRecipe() {
        viewModel.didPressSelectFavoriteRecipe()
    }

    fileprivate func elementsCustom() {
        contentView.layer.cornerRadius = 20
        tableView.layer.cornerRadius = 15
        
        getDirectionButton.layer.cornerRadius = 15
        getDirectionButton.layer.borderWidth = 1
        getDirectionButton.layer.borderColor = UIColor.orange.cgColor
    }
    
    private func navigationBar() {
        navigationItem.title = Accessibility.RecipeDetailView.title
    }
    
}
