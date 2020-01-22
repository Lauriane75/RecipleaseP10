//
//  CreationsListRepository.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 22/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import CoreData

protocol CreationListRepositoryType {
    func getCreations(callback: @escaping ([CreationItem]) -> Void)
    func didPressRemoveCreation(titleCreation: String)
}

final class CreationListRepository: CreationListRepositoryType {

    func getCreations(callback: @escaping ([CreationItem]) -> Void) {
        let requestCreation: NSFetchRequest<CreationObject> = CreationObject.fetchRequest()
        guard let creations = try? AppDelegate.viewContext.fetch(requestCreation) else { return }
        let creation : [CreationItem] = creations.map  {
            return CreationItem(name: $0.titleCreation ?? "", ingredient: $0.ingredientCreation ?? "", method: $0.methodCreation ?? "", time: $0.timeCreation ?? "", category: $0.dietCategoryCreation ?? "", yield: $0.yieldCreation ?? "")
        }
        print("getCreations : \(creation)")
        callback(creation)
    }

    func didPressRemoveCreation(titleCreation: String) {

          let request: NSFetchRequest<CreationObject> = CreationObject.fetchRequest()
          request.predicate = NSPredicate(format: "titleCreation == %@", titleCreation)
          do {
              let object = try AppDelegate.viewContext.fetch(request)
              if !object.isEmpty {
                  AppDelegate.viewContext.delete(object[0])
                  try? AppDelegate.viewContext.save()
              }
          } catch let error as NSError {
              print("Could not save. \(error), \(error.userInfo)")
          }
      }
}

