//
//  RecipeDetailViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol RecipeDetailViewModelDelegate: class {
    func didPressRecipeDetailView()
}

final class RecipeDetailViewModel {
    
    private var repository: RecipeDetailRepositoryType
    
    private var recipe: RecipeItem
    
    private weak var alertDelegate: AlertDelegate?
    
    private weak var delegate: RecipeDetailViewModelDelegate?
    
    private var starRate = 0
    
    // MARK: - Initializer
      
    init(delegate: RecipeDetailViewModelDelegate?, repository: RecipeDetailRepositoryType, recipe: RecipeItem, alertDelegate: AlertDelegate?) {
        self.delegate = delegate
        self.repository = repository
        self.recipe = recipe
        self.alertDelegate = alertDelegate
      }
    
    // MARK: - Output
    
    var recipeDisplayed: ((RecipeItem) -> Void)?
    var image: ((String) -> Void)?
    var timeLabel: ((String) -> Void)?
    var rateLabel: ((String) -> Void)?
    var yieldLabel: ((String) -> Void)?
    var nameRecipeButton: ((String) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        
        recipeDisplayed?(recipe)

        setUpTimeLabel()
        image?("\(recipe.imageName)")
        rateLabel?("\(starRate)")
        yieldLabel?("\(recipe.yield)")
        nameRecipeButton?("\(recipe.name)")
    }
    
    // MARK: - Private Functions

      fileprivate func setUpTimeLabel() {
          if recipe.time == 0 {
              let defaultValue = 30
              timeLabel?("\(defaultValue) min")
          } else {
              timeLabel?("\(recipe.time) min")
          }
      }
    
    func didPressstarRateButton(rate: Int) {
        starRate = rate
        rateLabel?("\(starRate)")

    }
    
    


}
