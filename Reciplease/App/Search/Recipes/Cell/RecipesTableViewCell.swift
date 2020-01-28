//
//  ResultRecipesTableViewCell.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 03/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class RecipesTableViewCell: UITableViewCell {
    
    // MARK: - Outlet
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var recipeIngredientLabel: UILabel!
    
    // MARK: - Private properties
    
    private var recipe: RecipeItem? = nil {
        
        didSet {
            guard let recipe = self.recipe else { return }
            nameLabel.text = recipe.name
            recipeImageView.layer.cornerRadius = 20
            recipeImageView.download(self.recipe!.imageName)
            recipeIngredientLabel.text = recipe.ingredient.prefix(2).joined(separator: ", ")
            if recipe.time == 0 {
                let defaultValue = "30 min"
                timeLabel.text = defaultValue
            } else {
                timeLabel.text = "\(recipe.time ) min"
            }
        }
    }
    
    func updateCell(with recipe: RecipeItem) {
        self.recipe = recipe
    }
}
