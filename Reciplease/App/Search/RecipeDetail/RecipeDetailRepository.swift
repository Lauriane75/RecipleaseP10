//
//  RecipeDetailRepository.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 10/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
import CoreData

protocol RecipeDetailRepositoryType {
    func didPressAddFavoriteRecipe(recipe: RecipeItem)
    func didPressFavoriteVerifying(recipeName: String, completion: (Bool) -> Void)
    func didPressRemoveFavoriteRecipe(recipeName: String)

}

final class RecipeDetailRepository: RecipeDetailRepositoryType {
    func didPressAddFavoriteRecipe(recipe: RecipeItem) {
        
    }

    
    func didPressFavoriteVerifying(recipeName: String, completion: (Bool) -> Void) {
        
    }
    
    func didPressRemoveFavoriteRecipe(recipeName: String) {
        
    }
    
}


