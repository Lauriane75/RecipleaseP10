//
//  CreationCoordinator.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 12/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class CreationsCoordinator {
    
    // MARK: - Properties
    
    private let presenter: UINavigationController
    
    private let screens: Screens
    
    private var creationsArray: CreationItem? = nil
    
    // MARK: - Initializer
    
    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screens = screens
    }
    
    // MARK: - Coodinator
    
    func start() {
        showCreationsList()
    }
    
    private func showCreationsList() {
        let viewController = screens.createCreationsListViewController(delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }
    
    private func showCreationDetailList(creations : CreationItem) {
        let viewController = screens.createCreationDetailViewController(creationSaved: creations, delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }
    
    private func showAlert(for type: AlertType) {
        let alert = screens.createAlertView(for: type)
        presenter.visibleViewController?.present(alert, animated: true, completion: nil)
    }
}

extension CreationsCoordinator: CreationsListViewModelDelegate {
    
    func selectCreation(creation: CreationItem) {
        showCreationDetailList(creations: creation)
    }
    
    func displayAlert(for type: AlertType) {
        showAlert(for: type)
    }
}

extension CreationsCoordinator: CreationDetailViewModelDelegate {
    func showCreationsListView() {
        showCreationsList()
    }
}
