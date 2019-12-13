//
//  MainCoordinator.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class MainCoordinator: NSObject, UITabBarControllerDelegate {
    
    private let presenter: UIWindow
    
    private let tabBarController: UITabBarController
    
    private let screens: Screens
    
    private var tabBarSource: TabBarSourceType = TabBarSource()
    
    private var searchCoordinator: SearchCoordinator?
    
    private var favoriteRecipesCoordinator: FavoriteRecipesCoordinator?
    
    // MARK: - Init
    
    init(presenter: UIWindow) {
        self.presenter = presenter
        
        self.screens = Screens()
        
        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = tabBarSource.items
        tabBarController.selectedViewController = tabBarSource[.search]
        
        super.init()
        
        tabBarController.delegate = self
    }
    
    func start() {
        presenter.rootViewController = tabBarController
        showSearchView()
    }
    
    private func showSearchView() {
        searchCoordinator = SearchCoordinator(presenter: tabBarSource[.search], screens: screens)
        searchCoordinator?.start()
    }
    
    private func showfavoriteView() {
        favoriteRecipesCoordinator = FavoriteRecipesCoordinator(presenter: tabBarSource[.favorite], screens: screens)
        favoriteRecipesCoordinator?.start()
    }
}

extension MainCoordinator {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        guard index < tabBarSource.items.count, let item = ViewControllerItem(rawValue: index) else {
            fatalError("error")
        }
        
        switch item {
        case .search:
            showSearchView()
        case .favorite:
            showfavoriteView()
        }
    }
}
