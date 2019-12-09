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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    appCoordinator = AppCoordinator(appDelegate: self)
    appCoordinator?.start()
    return true
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
           let container = NSPersistentContainer(name: "Reciplease")
           container.loadPersistentStores(completionHandler: { (storeDescription, error) in
               if let error = error as NSError? {
                   fatalError("Unresolved error \(error), \(error.userInfo)")
               }
           })
           return container
    }()
    
    static var persistentContainer: NSPersistentContainer {
          return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
      }
      
    static var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
      }

   
}

