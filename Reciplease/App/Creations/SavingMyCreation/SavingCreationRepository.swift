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
    func didPressSaveImage(image: Data?)
}

final class SavingCreationRepository: SavingCreationRepositoryType {
    
    func didPressSaveButton(creation: CreationItem) {
        
        let creationObject = CreationObject(context: AppDelegate.viewContext)
        creationObject.titleCreation = creation.name
        creationObject.ingredientCreation = creation.ingredient
        creationObject.methodCreation = creation.method
        creationObject.timeCreation = creation.time
        creationObject.categoryCreation = creation.category
        creationObject.yieldCreation = creation.yield
        
        try? AppDelegate.viewContext.save()
    }

    func didPressSaveImage(image: Data?) {
        
        let creationImage = CreationImage(context: AppDelegate.viewContext)
        creationImage.image = image
        
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
}
