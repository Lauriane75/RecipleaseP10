//
//  Alert.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 28/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

enum AlertType {
    case errornoService, errornoRecipeFound, errorWrongIngredient
}

struct Alert {
    let title: String
    let message: String
}

extension Alert {
    init(type: AlertType) {
        switch type {
        case .errornoService:
            self = Alert(title: "No service", message: "Can't connect to a cellular network")
        case .errornoRecipeFound:
            self = Alert(title: "Error", message: "No recipe found please try again")
        case .errorWrongIngredient:
            self = Alert(title: "Error", message: "Please try to enter at least one ingredient.")
        }
    }
}

protocol AlertDelegate: class {
    func displayAlert(type: AlertType)
}

