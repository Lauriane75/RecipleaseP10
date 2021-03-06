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
    
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var categoryLabel: UILabel!

    @IBOutlet weak var yieldLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var showCreationListButton: UIButton!
    
    var viewModel: CreationDetailViewModel!

    var creationsListViewController = CreationsListViewController()
    
    private lazy var creationDetailDataSource = CreationDetailDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar()

        elementsCustom()

        self.tableView.dataSource = creationDetailDataSource

        bind(to: viewModel)
        
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: CreationDetailViewModel) {
        
        guard titleLabel.text != nil else { return }
        
        viewModel.titleLabel = { [weak self] text in
            self?.titleLabel.text = text
        }
        
        viewModel.timeLabel = { [weak self] text in
            self?.timeLabel.text = text
        }
        
        viewModel.categoryLabel = { [weak self] text in
            self?.categoryLabel.text = text
        }
        viewModel.yieldLabel = { [weak self] text in
            self?.yieldLabel.text = text
        }
        viewModel.creationButton = { [weak self] text in
            self?.showCreationListButton.setTitle(text, for: .normal)
        }
        viewModel.ingredientsAndMethodLabel = { [weak self] text in
            self?.creationDetailDataSource.update(with: text)
            self?.tableView.reloadData()
        }
        viewModel.imageData = { [weak self] data in
            guard data != nil else { return }
            self?.imageView.image = UIImage(data: data!)
        }
    }
    
    // MARK: - View actions
    
    @IBAction func didPressDeleteCreation(_ sender: Any) {
        viewModel.didPressDeleteCreationButton()
    }
    
    @IBAction func didPressShowCreationsListButton(_ sender: Any) {
        viewModel.didPressMyCreationsButton()
    }
    
    // MARK: - Private Files
    
    fileprivate func navigationBar() {
        viewModel.navBarTitle = { text in
            self.navigationItem.title = text
        }
        let titleColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleColor
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .orange
    }
    
    fileprivate func elementsCustom() {
        contentView.layer.cornerRadius = 20
        tableView.layer.cornerRadius = 15
        showCreationListButton.layer.cornerRadius = 15
        showCreationListButton.layer.borderWidth = 1
        showCreationListButton.layer.borderColor = UIColor.orange.cgColor
    }
}
