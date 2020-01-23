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

    // MARK: - View life cycl

    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar()

        tableView.delegate = creationsListDataSource
        tableView.dataSource = creationsListDataSource

        bind(to: viewModel)

        bind(to: creationsListDataSource)
    }

    // MARK: - Private Functions

    private func bind(to viewModel: CreationsListViewModel) {
        viewModel.creationItem = { [weak self] creations in
            viewModel.imageData = { [weak self] image in
                self?.creationsListDataSource.update(updatedCreations: creations, imageData: image)
                self?.tableView.reloadData()
            }
        }
        viewModel.imageData = { data in
            print("imageData in vclList = \(data)")
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
}
