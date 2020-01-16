//
//  RecipeItem.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 02/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import CoreData

struct RecipeItem: Equatable {
    let name: String
    let imageName: String
    let url: String
    let ingredient: [String]
    let time: Int
    let yield: Int
    let dietLabels: [String]

    static func == (parameterLhs: RecipeItem, parameterRhs: RecipeItem) -> Bool {
        return parameterLhs.name == parameterRhs.name && parameterLhs.imageName == parameterRhs.imageName && parameterLhs.url == parameterRhs.url && parameterLhs.ingredient == parameterRhs.ingredient && parameterLhs.time == parameterRhs.time && parameterLhs.yield == parameterRhs.yield && parameterLhs.dietLabels == parameterRhs.dietLabels
    }
}


