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
        let viewController = screens.createCreationsViewController(title: "", ingredients: "", method: "", time: "", category: "", yield: "", delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }

    
    private func showAlert(for type: AlertType) {
        let alert = screens.createAlertView(for: type)
        presenter.visibleViewController?.present(alert, animated: true, completion: nil)
    }
}

extension CreationsCoordinator: CreationsViewModelDelegate {
    func displayAlert(for type: AlertType) {
        showAlert(for: type)
    }
}



