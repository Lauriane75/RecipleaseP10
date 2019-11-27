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
    
    private weak var delegate: RecipeDetailViewModelDelegate?
    
    // MARK: - Initializer
      
      init(delegate: RecipeDetailViewModelDelegate?) {
          self.delegate = delegate
      }
}
