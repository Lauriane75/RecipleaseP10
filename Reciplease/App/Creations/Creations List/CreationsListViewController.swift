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

    var viewModel: CreationDetailViewModel!

    private var creationsListDataSource = CreationsListDataSource()

    // MARK: - View life cycl

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar()

        tableView.delegate = creationsListDataSource
        tableView.dataSource = creationsListDataSource

        bind(to: creationsListDataSource)
        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    // MARK: - Private Functions

    private func bind(to viewModel: CreationDetailViewModel) {
        viewModel.creationDisplayed = { [weak self] creations in
            self?.creationsListDataSource.update(updatedCreations: creations)
            self?.tableView.reloadData()
        }
    }

    private func bind(to source: CreationsListDataSource) {

    }


    // MARK: - Private Functions

    //    fileprivate func elementsCustom() {
    //        contentView.layer.cornerRadius = 20
    //        getDirectionButton.layer.cornerRadius = 15
    //        tableView.layer.cornerRadius = 15
    //        getDirectionButton.layer.borderWidth = 1
    //        getDirectionButton.layer.borderColor = UIColor.orange.cgColor
    //    }
    //
    //    private func navigationBar() {
    //        let image = UIImage(named: "reciplease-favorite-logo")
    //        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(didPressSelectFavoriteRecipe))
    //        navigationItem.title = Accessibility.DetailView.title
    //
    //    }

    // MARK: - View actions

    private func navigationBar() {
        navigationItem.title = Accessibility.CreationsList.title
           let titleColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
           navigationController?.navigationBar.titleTextAttributes = titleColor
           self.navigationController?.navigationBar.tintColor = .white
           self.navigationController?.navigationBar.barTintColor = .orange
       }


}
