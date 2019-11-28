//
//  SearchViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol SearchViewModelDelegate: class {
    func didSelectIngredient(ingredient: String)
    func errorNoRecipeFound(for type: AlertType)
}

final class SearchViewModel {
    
    // MARK: - Properties
       
       private weak var delegate: SearchViewModelDelegate?
       
       private weak var alertDelegate: AlertDelegate?
       
//       private var item:
       
       private var ingredientList: [String] = [] {
           didSet {
            guard ingredientList != [] else
            {self.alertDelegate?.displayAlert(type: .errorWrongIngredient); return}
               ingredients?(ingredientList)
           }
       }
    
    // MARK: - Initializer
       
    init(delegate: SearchViewModelDelegate?, alertDelegate: AlertDelegate?) {
           self.delegate = delegate
           self.alertDelegate = alertDelegate
       }
    
    // MARK: - Output

       var titleLabel: ((String) -> Void)?
              
       var placeHolderTextField: ((String) -> Void)?
       
       var addButton: ((String) -> Void)?
       
       var ingredientListLabel: ((String) -> Void)?
       
       var clearButton: ((String) -> Void)?
       
       var ingredients: (([String]) -> Void)?
       
       var ingredientTextField: ((String) -> Void)?
              
       var searchButton: ((String) -> Void)?
    
       var searchButtonIsHidden: ((Bool) -> Void)?

    // MARK: - Input
    
    func viewDidLoad() {
        titleLabel?("What's in your fridge?")
        placeHolderTextField?("Lemon, Cheese, Sausages ...")
        addButton?("Add")
        ingredientListLabel?("In your fridge :")
        clearButton?("Clear")
        searchButton?("Search")
        searchButtonIsHidden?(true)
    }
    
}
