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
    
    weak var delegate: RecipeDetailViewControllerDelegate?
    
    private lazy var recipeDetailDataSource = RecipeDetailDataSource()
    
    private var starRate = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
        
        self.tableView.dataSource = recipeDetailDataSource
        
        elementsCustom()
        
        navigationBar()
        
    }
    
    private func bind(to viewModel: RecipeDetailViewModel) {
        
        viewModel.recipeDisplayed = { [weak self] recipe in
            self?.recipeDetailDataSource.update(with: recipe)
            self?.tableView.reloadData()
        }
        viewModel.image = { [weak self] url in
            guard let image = url.transformURLToImage() else { return }
            self?.imageView.image = image
        }
        viewModel.dietLabel = { [weak self] text in
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
    }
    
    
    // MARK: - View actions
    
    @IBAction func didPressNameRecipeButton(_ sender: Any) {
        viewModel.didPPressSafariButton()
    }
    
    @objc func didPressSelectFavoriteRecipe() {
        viewModel.didPressSelectFavoriteRecipe()
    }
    
    // MARK: - Private Functions
    
    fileprivate func elementsCustom() {
        contentView.layer.cornerRadius = 20
        getDirectionButton.layer.cornerRadius = 15
        tableView.layer.cornerRadius = 15
        getDirectionButton.layer.borderWidth = 1
        getDirectionButton.layer.borderColor = UIColor.orange.cgColor
    }
    
    private func navigationBar() {
        let image = UIImage(named: "reciplease-favorite-logo")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(didPressSelectFavoriteRecipe))
    }
    
}
