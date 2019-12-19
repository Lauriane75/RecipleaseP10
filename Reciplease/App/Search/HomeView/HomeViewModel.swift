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
    func displayHomeAlert(for type: AlertType)
}

final class HomeViewModel {
    
    // MARK: - Properties
    
    private weak var delegate: HomeViewModelDelegate?
        
    private var ingredientList: [String] = [] {
        didSet {
            guard ingredientList != [] else { return }
                ingredients?(ingredientList)
        }
    }
    
    // MARK: - Initializer
    
    init(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
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
        self.delegate?.displayHomeAlert(for: .errorIngredientListEmpty)
    }
    
    func didPressSearchForRecipes() {
        let ingredientName = ingredientList.joined(separator:", ")
        self.delegate?.didSelectIngredient(ingredient: ingredientName)
    }
}
