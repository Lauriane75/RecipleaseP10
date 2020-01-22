////
////  CreationRecipeRepository.swift
////  Reciplease
////
////  Created by Lauriane Haydari on 16/01/2020.
////  Copyright © 2020 Lauriane Haydari. All rights reserved.
////
import CoreData

protocol SavingCreationRepositoryType {
    func didPressSaveButton(creation: CreationItem)
    func didPressRemoveCreation(titleCreation: String)
    func didPressAddPhoto(image: NSData)
}

final class SavingCreationRepository: SavingCreationRepositoryType {
    
    func didPressSaveButton(creation: CreationItem) {
        
        let creationObject = CreationObject(context: AppDelegate.viewContext)

//        creationObject.imageCreation = creation.image
        creationObject.titleCreation = creation.name
        creationObject.ingredientCreation = creation.ingredient
        creationObject.methodCreation = creation.method
        creationObject.timeCreation = creation.time
        creationObject.dietCategoryCreation = creation.category
        creationObject.yieldCreation = creation.yield
        
        try? AppDelegate.viewContext.save()
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

    func didPressAddPhoto(image: NSData) {

        let creationObject = CreationObject(context: AppDelegate.viewContext)

        creationObject.imageCreation = image as Data

        try? AppDelegate.viewContext.save()

    }


}
