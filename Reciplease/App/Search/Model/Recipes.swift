//
//  Recipes.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 02/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

// MARK: - Recipes
struct Recipes: Codable {
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe
}

// MARK: - Recipe
struct Recipe: Codable {
    let label: String
    let image: String
    let url: String
    let ingredientLines: [String]
    let totalTime: Int
}
