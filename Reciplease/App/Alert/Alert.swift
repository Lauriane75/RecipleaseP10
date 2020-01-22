//
//  Alert.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 28/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

enum AlertType {
    case errorService, errorNoRecipeFound, errorIngredientListEmpty, noCreation, itemEmpty
}

struct Alert {
    let title: String
    let message: String
}

extension Alert {
    init(type: AlertType) {
        switch type {
        case .errorService:
            self = Alert(title: "Error", message: "No service connection")
        case .errorNoRecipeFound:
            self = Alert(title: "Error", message: "No recipe found please try again")
        case .errorIngredientListEmpty:
            self = Alert(title: "Is your fridge empty ?", message: "Please add your first ingredient then press +")
        case .noCreation:
                   self = Alert(title: "No creation saved yet", message: "You can create your own recipe, go back to the home page")
        case .itemEmpty:
            self = Alert(title: "You forgot to fill an item", message: "Please make sure to fill all items to create your recipe and don't forget the picture!")
        }
    }
}

