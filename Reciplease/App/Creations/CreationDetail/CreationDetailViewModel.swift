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

final class CreationDetailViewModel {

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
        self.timeSaved = timeSaved
        self.categorySaved = categorySaved
        self.yieldSaved = yieldSaved
    }

    // MARK: - Output

    //       var creationDisplayed: ((CreationItem) -> Void)?
    var titleLabel: ((String) -> Void)?
    var ingredients: ((String) -> Void)?
    var method: ((String) -> Void)?

    var timeLabel: ((String) -> Void)?
    var dietLabel: ((String) -> Void)?
    var yieldLabel: ((String) -> Void)?

    var creationButton: ((String) -> Void)?



    // MARK: - Input

    func viewDidLoad() {

        self.titleLabel?(titleSaved)
        self.timeLabel?(timeSaved)
        self.dietLabel?(categorySaved)
        self.yieldLabel?(yieldSaved)
        self.creationButton?("Creations")
    }

    func didPressShowCreationsList() {

        print("didPressShowCreationsList \(timeSaved)")

    }

    //       func didSelectCreationRecipe(titleTextField: String, ingredientTextField: String, methodTextField: String, timeTextField: String, dietCategoryTextField: String, yieldTextField: String) {
    //           repository.didPressSaveButton(title: titleTextField, ingredients: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField)
    //    }
}
