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


    override func viewDidLoad() {
            super.viewDidLoad()
        
        bind(to: viewModel)
             
        viewModel.viewDidLoad()
        
        self.tableView.dataSource = recipeDetailDataSource
        
        elementsCustom()
        
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
        viewModel.bookMarkedLabel = { [weak self] text in
            self?.bookMarkedLabel.text = text
        }
        viewModel.nameRecipeButton = { [weak self] text in
            self?.getDirectionButton.setTitle(text, for: .normal)
        }
        viewModel.servingsLabel = { [weak self] text in
            self?.servingsLabel.text = text
        }
        viewModel.timeLabel = { [weak self] text in
            self?.timeLabel.text = text
        }
    }
    
    @IBAction func didTapGetDirectionButton(_ sender: Any) {
    }
    
    // MARK: - Private Functions

    fileprivate func elementsCustom() {
        contentView.layer.cornerRadius = 20
        getDirectionButton.layer.cornerRadius = 20
        tableView.layer.cornerRadius = 20
    }
       
}
