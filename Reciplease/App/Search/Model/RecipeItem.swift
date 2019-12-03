//
//  RecipeItem.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 02/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
import CoreData

struct RecipeItem: Equatable {
    let name: String
    let imageURLString: String
    let url: String
    let ingredient: [String]
    
    static func ==(lhs: RecipeItem, rhs: RecipeItem) -> Bool {
        return lhs.name == rhs.name && lhs.imageURLString == rhs.imageURLString && lhs.url == rhs.url && lhs.ingredient == rhs.ingredient
    }
}
