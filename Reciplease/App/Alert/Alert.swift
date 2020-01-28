//
//  Alert.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 28/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

enum AlertType {
    case errorService, errorNoRecipe, errorIngredientListEmpty, noCreation, itemEmpty, restricted, denied
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
        case .errorNoRecipe:
            self = Alert(title: "No recipe found yet", message: "Please ingredients you have in your fridge and look for recipes")
        case .errorIngredientListEmpty:
            self = Alert(title: "Is your fridge empty ?", message: "Please add your first ingredient then press +")
        case .noCreation:
            self = Alert(title: "No creation saved yet", message: "You can create your own recipe, go back to the home page")
        case .itemEmpty:
            self = Alert(title: "You forgot to fill an item", message: "Please make sure to fill all items to create your recipe and don't forget the picture!")
            
        case .restricted:
            self = Alert(title: "Photo library restricted", message: "Photo library acces is restriced and can't be accessed")
        case .denied:
            self = Alert(title: "Photo library denied", message: "Photo library acces was denied and can't be accessed. Please update your settings if you want to change it")
        }
    }
}

//let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)


//
//let alert = UIAlertController(title: "Photo library denied", message: "Photo library acces was denied and can't be accessed. Please update your settings if you want to change it", preferredStyle: .alert)
