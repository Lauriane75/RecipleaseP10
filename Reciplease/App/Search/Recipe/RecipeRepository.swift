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

protocol RecipeRepositoryType: class {
    func getRecipes(url: URL, success: @escaping (Result<[RecipeItem]>) -> Void, onError: @escaping (String) -> Void)
}

final class RecipeRepository: RecipeRepositoryType {
    
    private let network: NetworkRequestType
    
    let requestType: RequestType
    
    init(requestType: RequestType, network: NetworkRequestType) {
        self.requestType = requestType
        self.network = network
    }
    
    func getRecipes(url: URL, success: @escaping (Result<[RecipeItem]>) -> Void, onError: @escaping (String) -> Void) {
        switch requestType {
        case .network:
            network.request(type: Recipes.self, url: url) { (result) in
                switch result {
                    
                case .success(value: let recipeItems):
                    let result: [RecipeItem] = recipeItems.hits.map {
                        return      RecipeItem(name: $0.recipe.label,
                                    imageName: $0.recipe.image,
                                    url: $0.recipe.url,
                                    ingredient: $0.recipe.ingredientLines.map { $0}, time:  $0.recipe.totalTime, yield: $0.recipe.yield)}
                    success(.success(value: result))

                case .error(error: let error):
                    onError(error.localizedDescription)
                }
            }
        case .persistence:
            let request: NSFetchRequest<RecipeObject> = RecipeObject.fetchRequest()
            guard let recipes = try? AppDelegate.viewContext.fetch(request) else { return}
            let recipeItem : [RecipeItem] = recipes.map  { return RecipeItem(name: $0.recipeName!,
                                                                             imageName: $0.recipeImage ?? "", url: $0.recipeURL ?? "",
                                                                             ingredient: ($0.recipeIngredients?.components(separatedBy: "@") ?? [""]), time: Int($0.recipeTime), yield: Int($0.yieldRecipe))
            }
            success(.success(value: recipeItem))
        }
    }
}

