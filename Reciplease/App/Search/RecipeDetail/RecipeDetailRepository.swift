//
//  RecipeDetailRepository.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 10/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import CoreData

protocol RecipeDetailRepositoryType {
    func didPressSelectFavoriteRecipe(recipe: RecipeItem, image: String)
    func verifyingFavoriteState(recipeName: String, completion: (Bool) -> Void)
    func didPressRemoveFavoriteRecipe(recipeName: String)
    func selectedFavoriteStarFill() -> String
    func unselectedFavoriteStar() -> String
    func getFavoriteImageStatus(callback: @escaping (String) -> Void)

    var state: String { get }

}

final class RecipeDetailRepository: RecipeDetailRepositoryType {

    var state: String = ""
    
    func didPressSelectFavoriteRecipe(recipe: RecipeItem, image: String) {
        
        let recipeObject = RecipeObject(context: AppDelegate.viewContext)
        let favoriteImage = FavoriteImage(context: AppDelegate.viewContext)
        favoriteImage.imageStatus = image
        recipeObject.recipeURL = recipe.url
        recipeObject.recipeImage = recipe.imageName
        recipeObject.recipeName = recipe.name
        recipeObject.recipeIngredients =
            recipe.ingredient.joined(separator: " ")
        recipeObject.recipeTime = Int16(Int(recipe.time))
        recipeObject.recipeYield = Int16(Int(recipe.yield))
        recipeObject.dietLabelsRecipe = recipe.dietLabels.joined(separator: " ")
        try? AppDelegate.viewContext.save()
    }
    
    func verifyingFavoriteState(recipeName: String, completion: (Bool) -> Void) {
        
        let request: NSFetchRequest<RecipeObject> = RecipeObject.fetchRequest()
        request.predicate = NSPredicate(format: "recipeName == %@", recipeName)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \RecipeObject.recipeName, ascending: true)]
        
        guard let recipes = try? AppDelegate.viewContext.fetch(request) else { print("error")
            return
        }
        
        if recipes == [] { completion (false)
            state = "star"

            return
        }
        completion(true)
        state = "star.fill"
    }
    
    func didPressRemoveFavoriteRecipe(recipeName: String) {
        
        let request: NSFetchRequest<RecipeObject> = RecipeObject.fetchRequest()
        request.predicate = NSPredicate(format: "recipeName == %@", recipeName)
        
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

    func selectedFavoriteStarFill() -> String {
        let favoriteImage = FavoriteImage(context: AppDelegate.viewContext)
        favoriteImage.imageStatus = "star.fill"
        try? AppDelegate.viewContext.save()
        return  favoriteImage.imageStatus!
    }

    func unselectedFavoriteStar() -> String {
        let favoriteImage = FavoriteImage(context: AppDelegate.viewContext)
        favoriteImage.imageStatus = "star"
        try? AppDelegate.viewContext.save()
        return  favoriteImage.imageStatus!
    }

    func getFavoriteImageStatus(callback: @escaping (String) -> Void) {
        let request = NSFetchRequest<FavoriteImage>(entityName: "FavoriteImage")
        _ = try? AppDelegate.viewContext.fetch(request)
    }
}
