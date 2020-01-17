//
//  CreationItem.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 17/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation
import UIKit

struct CreationItem: Equatable {
    let name: String
    let image: UIImage
    let ingredient: String
    let time: Int
    let yield: Int
    let dietLabels: String

    static func == (parameterLhs: CreationItem, parameterRhs: CreationItem) -> Bool {
        return parameterLhs.name == parameterRhs.name && parameterLhs.image == parameterRhs.image && parameterLhs.ingredient == parameterRhs.ingredient && parameterLhs.time == parameterRhs.time && parameterLhs.yield == parameterRhs.yield && parameterLhs.dietLabels == parameterRhs.dietLabels
    }
}
