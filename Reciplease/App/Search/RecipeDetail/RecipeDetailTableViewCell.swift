//
//  RecipeDetailTableViewCell.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 09/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class RecipeDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientsLabel: UILabel!
    
     // MARK: - Private properties
    
    private var recipe: RecipeItem?
      
    private var row: Int?
    
    func updateCell(with recipe: RecipeItem, row: Int) {
          self.recipe = recipe
          self.row = row
//        ingredientsLabel.text = recipe.ingredient[row]
        ingredientsLabel.text = "# \(recipe.ingredient.prefix(8).joined(separator: ", "))"
        

    }

}
