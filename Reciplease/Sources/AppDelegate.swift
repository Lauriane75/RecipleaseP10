//
//  AppDelegate.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    var context: Context!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let stack = CoreDataStack(modelName: "Reciplease",
                                  type: .prod)
        context = Context(stack: stack)
        appCoordinator = AppCoordinator(appDelegate: self,
                                        context: context, stack: stack)
        appCoordinator?.start()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}

