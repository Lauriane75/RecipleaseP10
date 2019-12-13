//
//  FavoriteRecipesTableViewCell.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 05/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

class FavoriteRecipesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    // MARK: - Private properties
    
    private var recipe: RecipeItem?
    
    private var row: Int?
    
    func updateCell(with recipe: RecipeItem, row: Int) {
        self.recipe = recipe
        self.row = row
        
        if let image = recipe.imageName.transformURLToImage() {
            favoriteImageView.image = image
        }
        
        nameLabel.text = "\(recipe.name)"
        
        ingredientsLabel.text = "\(recipe.ingredient.joined(separator: "\n"))"
    }
    
}
