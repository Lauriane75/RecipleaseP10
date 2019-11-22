//
//  MainCoordinator.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

enum ViewControllerItem: Int {
    case search = 0
    case favorite
}

protocol TabBarSourceType {
    var items: [UINavigationController] { get set }
}

extension TabBarSourceType {
    subscript(item: ViewControllerItem) -> UINavigationController {
        get {
            guard !items.isEmpty, item.rawValue < items.count, item.rawValue >= 0 else {
                fatalError("Item does not exists")
            }
            return items[item.rawValue]
        }
    }
}

fileprivate class TabBarSource: TabBarSourceType {
    var items: [UINavigationController] = [
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil)    ]
    
    let searchItem = UIImage(named: "search-icon")
    let favoriteItem = UIImage(named: "favorite-icon")

    init() {
        self[.search].tabBarItem.image = searchItem
        self[.favorite].tabBarItem.image = favoriteItem
    }
}

final class MainCoordinator: NSObject, UITabBarControllerDelegate {

    private let presenter: UIWindow

    private let tabBarController: UITabBarController

    private let screens: Screens

    private var tabBarSource: TabBarSourceType = TabBarSource()
    
    private var searchCoordinator: SearchCoordinator?

    private var favoriteCoordinator: FavoriteCoordinator?

    // MARK: - Init

    init(presenter: UIWindow, context: Context) {
        self.presenter = presenter

        self.screens = Screens(context: context)

        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = tabBarSource.items
        tabBarController.selectedViewController = tabBarSource[.search]

        super.init()

        tabBarController.delegate = self
    }

    func start() {
        presenter.rootViewController = tabBarController
        showMainView()
    }

    private func showMainView() {
        searchCoordinator = SearchCoordinator(presenter: tabBarSource[.search], screens: screens)
        searchCoordinator?.start()
    }

    private func showfavoriteView() {
        favoriteCoordinator = FavoriteCoordinator(presenter: tabBarSource[.favorite], screens: screens)
        favoriteCoordinator?.start()
    }
}

extension MainCoordinator {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        guard index < tabBarSource.items.count, let item = ViewControllerItem(rawValue: index) else {
            fatalError("Selected ViewController Index Out Of range")
        }

        switch item {
        case .search:
            showMainView()
        case .favorite:
            showfavoriteView()
        }
    }
}
