//
//  RecipeRepository.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 04/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
import CoreData

enum Result<T> {
    case success(value: T)
    case error(error: Error)
}

enum RequestType {
    case network
    case persistence
}

protocol RecipesRepositoryType: class {
    func getRecipes(url: URL, success: @escaping (Result<[RecipeItem]>) -> Void, error: @escaping (String) -> Void)
}

final class RecipesRepository: RecipesRepositoryType {
    
    private let network: NetworkRequestType
    
    let requestType: RequestType

    private let stack: CoreDataStack
    
    init(requestType: RequestType, network: NetworkRequestType, stack: CoreDataStack) {
        self.requestType = requestType
        self.network = network
        self.stack = stack
    }
    
    func getRecipes(url: URL, success: @escaping (Result<[RecipeItem]>) -> Void, error: @escaping (String) -> Void) {
        switch requestType {
        case .network:
            network.request(type: Recipes.self, url: url) { (result) in
                switch result {

                case .success(value: let recipeItems):
                    let result: [RecipeItem] = recipeItems.hits.map {
                        return      RecipeItem(name: $0.recipe.label,
                                               imageName: $0.recipe.image,
                                               url: $0.recipe.url,
                                               ingredient: $0.recipe.ingredientLines.map { $0}, time:  $0.recipe.totalTime, yield: $0.recipe.yield, category: $0.recipe.dietLabels)}
                    success(.success(value: result))

                case .error(error: let alert):
                    error(alert.localizedDescription)
                }
            }
        case .persistence:
            let requestRecipe: NSFetchRequest<RecipeObject> = RecipeObject.fetchRequest()
            guard let recipes = try? stack.context.fetch(requestRecipe) else { return }

            let recipeItem : [RecipeItem] = recipes.map  { return RecipeItem(object: $0)
            }
            success(.success(value: recipeItem))
        }
    }
}

extension RecipeItem {
    init(object: RecipeObject) {
        self.url = object.urlRecipe ?? ""
        self.imageName = object.imageRecipe ?? ""
        self.name = object.nameRecipe ?? ""
        self.ingredient = object.ingredientsRecipe?.components(separatedBy: ", ") ?? [", "]
        self.time = Int(object.timeRecipe)
        self.category = [object.categoryRecipe ?? ""]
        self.yield = Int(object.yieldRecipe)
    }
}
