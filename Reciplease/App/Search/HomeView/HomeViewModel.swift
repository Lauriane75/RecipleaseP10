//
//  SearchViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: class {
    func didSelectIngredient(ingredient: String)
    func errorNoRecipeFound(for type: AlertType)
}

final class HomeViewModel {
    
    // MARK: - Properties
    
    private weak var delegate: HomeViewModelDelegate?
    
    private weak var alertDelegate: AlertDelegate?
    
    private var ingredientList: [String] = [] {
        didSet {
            if ingredientList != [] {
                ingredients?(ingredientList)
            } else {
                alertDelegate?.displayAlert(type: .errorWrongIngredient)
            }
        }
    }
    
    // MARK: - Initializer
    
    init(delegate: HomeViewModelDelegate?, alertDelegate: AlertDelegate?) {
        self.delegate = delegate
        self.alertDelegate = alertDelegate
    }
    
    // MARK: - Output
    
    var titleLabel: ((String) -> Void)?
    
    var placeHolderTextField: ((String) -> Void)?
    
    var addButton: ((String) -> Void)?
    
    var listTitleLabel: ((String) -> Void)?
    
    var clearButton: ((String) -> Void)?
    
    var ingredients: (([String]) -> Void)?
    
    var ingredientTextField: ((String) -> Void)?
    
    var searchButton: ((String) -> Void)?
    
    var searchButtonIsHidden: ((Bool) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        titleLabel?("What's in your fridge?")
        placeHolderTextField?("Lemon, Sugar, Honey ...")
        addButton?("+")
        listTitleLabel?("In your fridge :")
        clearButton?("x")
        searchButton?("Go !")
        searchButtonIsHidden?(true)
        ingredients?(ingredientList)
    }
    
    func didPressAdd(ingredientSelected: String) {
        guard ingredientSelected != "" else { return }
        ingredientList.append(ingredientSelected)
        ingredientTextField?("")
        searchButtonIsHidden?(false)
    }
    
    func didPressClear() {
        ingredientList = [""]
        searchButtonIsHidden?(true)
    }
    
    func didPressSearchForRecipes() {
        let ingredientName = ingredientList.joined(separator:", ")
        self.delegate?.didSelectIngredient(ingredient: ingredientName)
    }
}
