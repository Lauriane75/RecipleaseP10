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
    
    init(requestType: RequestType, network: NetworkRequestType) {
        self.requestType = requestType
        self.network = network
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
            guard let recipes = try? AppDelegate.viewContext.fetch(requestRecipe) else { return }
            
            let recipeItem : [RecipeItem] = recipes.map  { return RecipeItem(name: $0.nameRecipe ?? "",
                                                                             imageName: $0.imageRecipe ?? "", url: $0.urlRecipe ?? "",
                                                                             ingredient: ($0.ingredientsRecipe?.components(separatedBy: ", ") ?? [", "]), time: Int($0.timeRecipe), yield: Int($0.yieldRecipe), category: ($0.categoryRecipe?.components(separatedBy: "") ?? [""]))
            }
            success(.success(value: recipeItem))
        }
    }
}

