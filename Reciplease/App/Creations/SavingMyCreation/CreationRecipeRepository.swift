////
////  CreationRecipeRepository.swift
////  Reciplease
////
////  Created by Lauriane Haydari on 16/01/2020.
////  Copyright © 2020 Lauriane Haydari. All rights reserved.
////
import CoreData

protocol CreationRecipeRepositoryType {
    func didPressSaveButton(creation: CreationItem)
    func getCreations()
}

final class CreationRecipeRepository: CreationRecipeRepositoryType {

    func didPressSaveButton(creation: CreationItem) {

        let creationObject = CreationObject(context: AppDelegate.viewContext)

        creationObject.titleCreation = creation.name
        creationObject.ingredientCreation = creation.ingredient
        creationObject.methodCreation = creation.method
        creationObject.timeCreation = creation.time
        creationObject.dietCategoryCreation = creation.category
        creationObject.yieldCreation = creation.yield
        
        try? AppDelegate.viewContext.save()
    }

    // didPressDeleteCreation()


    func getCreations() {
        let requestCreation: NSFetchRequest<CreationObject> = CreationObject.fetchRequest()
        guard let creations = try? AppDelegate.viewContext.fetch(requestCreation) else { return }

        let _ : [CreationItem] = creations.map  {
            return CreationItem(name: $0.titleCreation ?? "", ingredient: $0.ingredientCreation ?? "", method: $0.methodCreation ?? "", time: $0.timeCreation ?? "", category: $0.dietCategoryCreation ?? "", yield: $0.yieldCreation ?? "")
        }

    }

}
