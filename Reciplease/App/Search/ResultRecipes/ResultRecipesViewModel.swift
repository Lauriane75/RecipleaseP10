//
//  ResultRecipesViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 03/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol ResultRecipesViewModelDelegate: class {
    func didSelectRecipe(recipe: RecipeItem)
}


final class ResultRecipesViewModel {
    
    // MARK: - Properties
              
    private weak var delegate: ResultRecipesViewModelDelegate?

    private weak var alertDelegate: AlertDelegate?
              

    // MARK: - Initializer

    init(delegate: ResultRecipesViewModelDelegate, alertDelegate: AlertDelegate?) {
        self.delegate = delegate
        self.alertDelegate = alertDelegate
    }
    
        
    // MARK: - Output
    
    // MARK: - Input

    

    
}

