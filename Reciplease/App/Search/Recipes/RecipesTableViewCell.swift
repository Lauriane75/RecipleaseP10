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
            if let image = recipe?.imageName.transformURLToImage() {
                nameLabel.text = recipe?.name
                recipeImageView.layer.cornerRadius = 20
                recipeImageView.image = image
            }
            recipeIngredientLabel.text = recipe?.ingredient.prefix(2).joined(separator: ", ")
            if recipe?.time == 0 {
                let defaultValue = "30 min"
                timeLabel.text = defaultValue
            } else {
                timeLabel.text = "\(recipe?.time ?? 30) min"
            }
        }
    }
    
    func updateCell(with recipe: RecipeItem) {
        self.recipe = recipe
    }
    
}

// MARK: - Extension

extension String {
    func transformURLToImage() -> UIImage? {
        guard let imageUrl = URL(string: self) else {return nil}
        let imageData = try! Data(contentsOf: imageUrl)
        guard let image = UIImage(data: imageData) else { return nil}
        return image
    }
}

