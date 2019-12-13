//
//  AppCoordinator.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class AppCoordinator {
    
    // MARK: - Properties
    
    private unowned var appDelegate: AppDelegate
    
    private var mainCoordinator: MainCoordinator?
    
    // MARK: - Initializer
    
    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }
    
    // MARK: - Start
    
    func start() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window!.rootViewController = UIViewController()
        appDelegate.window!.makeKeyAndVisible()
        
        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }
        
        showMain()
    }
    
    // MARK: - Private
    
    private func showMain() {
        
        mainCoordinator = MainCoordinator(presenter: appDelegate.window!)
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().barTintColor = .orange
        
        mainCoordinator?.start()
    }
}

