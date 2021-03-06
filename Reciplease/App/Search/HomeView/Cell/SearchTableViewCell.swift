//
//  SearchTableViewCell.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 28/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class IngredientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ingredientLabel: UILabel!
    
    func updateCell(with ingredients: [String], row: Int) {
        let title = ingredients[row]
        
        ingredientLabel.text =  " \(title.firstCapitalized)"
    }
}

extension StringProtocol {
    
    var firstCapitalized: String {
        return String(prefix(1)).capitalized + dropFirst()
    }
}
