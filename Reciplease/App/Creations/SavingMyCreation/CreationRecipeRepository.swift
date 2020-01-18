////
////  CreationRecipeRepository.swift
////  Reciplease
////
////  Created by Lauriane Haydari on 16/01/2020.
////  Copyright © 2020 Lauriane Haydari. All rights reserved.
////
import CoreData

protocol CreationRecipeRepositoryType {
    func didPressSaveButton(title: String, ingredients: String, method: String, time: String, category: String, yield: String)
}

final class CreationRecipeRepository: CreationRecipeRepositoryType {


    func didPressSaveButton(title: String, ingredients: String, method: String, time: String, category: String, yield: String) {

        let creationObject = CreationObject(context: AppDelegate.viewContext)

        creationObject.titleCreation = title
        creationObject.ingredientCreation = ingredients
        creationObject.methodCreation = method
        creationObject.timeCreation = time
        creationObject.dietCategoryCreation = category
        creationObject.yieldCreation = yield
        
        try? AppDelegate.viewContext.save()
    }

//    func getCreations(title: String, ingredients: String, method: String, time: String, category: String, yield: String) {
//
//        let creationObject = CreationObject(context: AppDelegate.viewContext)
//
//        creationObject.titleCreation = title
//        creationObject.ingredientCreation = ingredients
//        creationObject.methodCreation = method
//        creationObject.timeCreation = time
//        creationObject.dietCategoryCreation = category
//        creationObject.yieldCreation = yield
//
//        print("getCreations call")
//    }
}
