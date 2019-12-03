//
//  Recipes.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 02/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

struct Recipes: Decodable {

    let hits: [Hit]

    struct Hit: Decodable {
        let recipe: RecipeProperties
    }

    struct RecipeProperties: Decodable {
        let label: String
        let image: String
        let url: String
        let ingredientLines: [String]
    }
}
