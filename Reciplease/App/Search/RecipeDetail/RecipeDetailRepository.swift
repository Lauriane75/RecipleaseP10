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
}

final class RecipeDetailRepository: RecipeDetailRepositoryType {
    
    private let stack: CoreDataStack
    
    init(stack: CoreDataStack) {
        self.stack = stack
    }
    
    func didPressSelectFavoriteRecipe(recipe: RecipeItem, image: String) {
        
        let recipeObject = RecipeObject(context: stack.context)
        let favoriteImage = FavoriteImage(context: stack.context)
        favoriteImage.imageStatus = image
        recipeObject.urlRecipe = recipe.url
        recipeObject.imageRecipe = recipe.imageName
        recipeObject.nameRecipe = recipe.name
        recipeObject.ingredientsRecipe = recipe.ingredient.joined(separator: " ")
        recipeObject.timeRecipe = Int16(Int(recipe.time))
        recipeObject.yieldRecipe = Int16(Int(recipe.yield))
        recipeObject.categoryRecipe = recipe.category.joined(separator: " ")
        stack.saveContext()
    }
    
    func verifyingFavoriteState(recipeName: String, completion: (Bool) -> Void) {
        
        let request: NSFetchRequest<RecipeObject> = RecipeObject.fetchRequest()
        request.predicate = NSPredicate(format: "nameRecipe == %@", recipeName)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \RecipeObject.nameRecipe, ascending: true)]
        
        guard let recipes = try? stack.context.fetch(request) else { print("error")
            return
        }
        
        if recipes == [] { completion (false)
            
            return
        }
        completion(true)
    }
    
    func didPressRemoveFavoriteRecipe(recipeName: String) {
        
        let request: NSFetchRequest<RecipeObject> = RecipeObject.fetchRequest()
        request.predicate = NSPredicate(format: "nameRecipe == %@", recipeName)
        do {
            let object = try stack.context.fetch(request)
            if !object.isEmpty {
                stack.context.delete(object[0])
                stack.saveContext()
            }
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
