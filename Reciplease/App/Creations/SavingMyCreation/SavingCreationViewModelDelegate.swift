//
//  SavingMyCreationViewModelDelegate.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 12/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol SavingCreationViewModelDelegate: class {

    func didPressSaveButton(title: String, ingredients: String, method: String, time: String, category: String, yield: String)

    func displayAlert(for type: AlertType)
}

final class SavingCreationViewModel {

    private var delegate: SavingCreationViewModelDelegate?

    //    private var creation: CreationItem

    private var repository: CreationRecipeRepositoryType

    // MARK: - Initializer

    init(delegate: SavingCreationViewModelDelegate?, repository: CreationRecipeRepositoryType) {
        self.delegate = delegate
        self.repository = repository
//        self.creation = creation
    }

    // MARK: - Output

    var creationDisplayed: ((CreationItem) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        print("CreateMyRecipeViewModel call")
    }

    func didPressSaveButton(titleTextField: String, ingredientTextField: String, methodTextField: String, timeTextField: String, dietCategoryTextField: String, yieldTextField: String) {
        repository.didPressSaveButton(title: titleTextField, ingredients: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField)
         self.delegate?.didPressSaveButton(title: titleTextField, ingredients: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField)
        print("elements saved")
    }

}
