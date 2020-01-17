//
//  CreationViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 12/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol CreationsViewModelDelegate: class {
    func displayAlert(for type: AlertType)
}

final class CreationsViewModel {

    private var repository: CreationRecipeRepositoryType

    private var delegate: CreationsViewModelDelegate?

    private var titleSaved: String
    private var ingredientsSaved: String
    private var methodSaved: String
    private var timeSaved: String
    private var categorySaved: String
    private var yieldSaved: String

    // MARK: - Initializer

    init(repository: CreationRecipeRepositoryType, delegate: CreationsViewModelDelegate?, titleSaved: String, ingredientsSaved: String, methodSaved: String, timeSaved: String, categorySaved: String, yieldSaved: String) {
        self.repository = repository
        self.delegate = delegate

        self.titleSaved = titleSaved
        self.ingredientsSaved = ingredientsSaved
        self.methodSaved = methodSaved
        self.timeSaved = titleSaved
        self.categorySaved = ingredientsSaved
        self.yieldSaved = methodSaved
    }

    // MARK: - Output

    //       var creationDisplayed: ((CreationItem) -> Void)?
    var tile: ((String) -> Void)?
    var ingredients: ((String) -> Void)?
    var method: ((String) -> Void)?

    var timeLabel: ((String) -> Void)?
    var dietLabel: ((String) -> Void)?
    var yieldLabel: ((String) -> Void)?

    // MARK: - Input

    func viewWillAppear() {
        print("CreationsViewModel call")
    }

//    func viewDidLoad() {
//        print("CreationsViewModel call")
//    }

    //       func didSelectCreationRecipe(titleTextField: String, ingredientTextField: String, methodTextField: String, timeTextField: String, dietCategoryTextField: String, yieldTextField: String) {
    //           repository.didPressSaveButton(title: titleTextField, ingredients: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField)
    //    }
}
