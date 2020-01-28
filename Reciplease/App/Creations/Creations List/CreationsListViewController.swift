//
//  CreationsListViewController.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 12/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class CreationsListViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var viewModel: CreationsListViewModel!
    
    private var creationsListDataSource = CreationsListDataSource()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar()
        
        tableView.delegate = creationsListDataSource
        tableView.dataSource = creationsListDataSource
        
        bind(to: viewModel)
        bind(to: creationsListDataSource)
        
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: CreationsListViewModel) {
        viewModel.creationItem = { [weak self] creations in
            self?.creationsListDataSource.update(updatedCreations: creations)
            self?.tableView.reloadData()
        }
    }
    
    private func bind(to source: CreationsListDataSource) {
        creationsListDataSource.selectedCreation = viewModel.didSelectCreation
        
    }
    
    // MARK: - Private Files
    
    private func navigationBar() {
        navigationItem.title = Accessibility.CreationsList.title
        let titleColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleColor
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .orange
    }
}
