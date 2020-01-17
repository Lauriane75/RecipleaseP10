//
//  TabBarSource.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 28/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

enum ViewControllerItem: Int {
    case search = 0
    case favorite
    case creations
}

protocol TabBarSourceType {
    var items: [UINavigationController] { get set }
}

final class TabBarSource: TabBarSourceType {
    var items: [UINavigationController] = [
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil)]
    
    let creationsItem = UIImage(named: "creations-item")

    init() {
        self[.search].tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        self[.favorite].tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        self[.creations].tabBarItem.image = creationsItem

    }
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
