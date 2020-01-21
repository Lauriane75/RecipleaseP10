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

    let creation = CreationItem(name: "", ingredient: "", method: "", time: "", category: "", yield: "")

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
        let viewController = screens.createCreationsListViewController(creationSaved: creation, delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }

//    private func showCreations(creation: CreationItem) {
//        let viewController = screens.createCreationsListViewController(creationSaved: , delegate: self)
//        presenter.pushViewController(viewController, animated: true)
//    }
    
    
    private func showAlert(for type: AlertType) {
        let alert = screens.createAlertView(for: type)
        presenter.visibleViewController?.present(alert, animated: true, completion: nil)
    }
}

extension CreationsCoordinator: CreationsViewModelDelegate {
    func selectCreation(creation: CreationItem) {
        
    }

    func didPressCreationsListButton(creation: CreationItem) {
//        showCreations(creation: creation)
    }
    
    func displayAlert(for type: AlertType) {
        showAlert(for: type)
    }
}


//    private func update (updatedCreations: CreationItem?) {
//        self.creationsArray = updatedCreations
////        print("creationArray = \(String(describing: creationsArray?.name))")
//    }


//        guard let creation = searchCoordinator?.creationsArray else { return }
//        print ("creationArray : \(creation)")
//        searchCoordinator?.didPressCreationsListButton(creation: creation)



