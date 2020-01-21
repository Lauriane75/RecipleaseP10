//
//  SavingMyCreationViewModelDelegate.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 12/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol SavingCreationViewModelDelegate: class {

    func didPressSaveButton(creation: CreationItem)

    func displayAlert(for type: AlertType)
}

final class SavingCreationViewModel {

    private var delegate: SavingCreationViewModelDelegate?

    private var repository: CreationRecipeRepositoryType

    // MARK: - Initializer

    init(delegate: SavingCreationViewModelDelegate?, repository: CreationRecipeRepositoryType) {
        self.delegate = delegate
        self.repository = repository
    }

    private var visibleCreation: [CreationItem] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.creationDisplayed?(self.visibleCreation)
            }
        }
    }

    // MARK: - Output

    var creationDisplayed: (([CreationItem]) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        print("CreateMyRecipeViewModel call")
    }

    func didPressSaveButton(titleTextField: String, ingredientTextField: String, methodTextField: String, timeTextField: String, dietCategoryTextField: String, yieldTextField: String) {
//        repository.didPressSaveButton(title: titleTextField, ingredients: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField)

        repository.didPressSaveButton(creation: CreationItem(name: titleTextField, ingredient: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField))

        self.visibleCreation.append(CreationItem(name: titleTextField, ingredient: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField))

        self.creationDisplayed?([CreationItem(name: titleTextField, ingredient: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField)])

        self.delegate?.didPressSaveButton(creation: CreationItem(name: titleTextField, ingredient: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField))
                print("elements saved")

        print("visibleCreation : \(visibleCreation)")
    }





}
