//
//  CreationDetailViewController.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 17/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class CreationDetailViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var yieldLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var showCreationListButton: UIButton!
    
    var viewModel: CreationDetailViewModel!
    
    private lazy var creationDetailDataSource = CreationDetailDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)

        viewModel.viewDidLoad()

        self.tableView.dataSource = creationDetailDataSource

        navigationBar()
    }
    
    // MARK: - View actions
    
    
    @IBAction func didPressShowCreationsListButton(_ sender: Any) {
        viewModel.didPressShowCreationsList()
    }
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: CreationDetailViewModel) {

        viewModel.titleLabel = { [weak self] text in
            self?.titleLabel.text = text
        }

        viewModel.timeLabel = { [weak self] text in
            self?.timeLabel.text = text
        }

        viewModel.dietLabel = { [weak self] text in
            self?.categoryLabel.text = text
        }
        viewModel.yieldLabel = { [weak self] text in
            self?.yieldLabel.text = text
        }
        viewModel.creationButton = { [weak self] text in
            self?.showCreationListButton.setTitle(text, for: .normal)
        }
        
        viewModel.ingredientsAndMethod = { [weak self] text in
        self?.creationDetailDataSource.update(with: text)
        self?.tableView.reloadData()
        }
    }

    private func navigationBar() {
        navigationItem.title = Accessibility.CreationDetailView.title
        let titleColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleColor
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .orange
    }
    
    
    
}
