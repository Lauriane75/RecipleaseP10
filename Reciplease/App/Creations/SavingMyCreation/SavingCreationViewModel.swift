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
    
    private var repository: SavingCreationRepositoryType
    
    var imageData: Data? = nil
    
    // MARK: - Initializer
    
    init(delegate: SavingCreationViewModelDelegate?, repository: SavingCreationRepositoryType) {
        self.delegate = delegate
        self.repository = repository
    }
    
    // MARK: - Output
    
    var creationDisplayed: (([CreationItem]) -> Void)?
    
    var label: ((String) -> Void)?
    
    var timePlaceholder: ((String) -> Void)?
    var categoryPlaceholder: ((String) -> Void)?
    var yieldPlaceholder: ((String) -> Void)?
    var titlePlaceholder: ((String) -> Void)?
    var ingredientsPlaceholder: ((String) -> Void)?
    var metohdPlaceholder: ((String) -> Void)?
    
    var saveButton: ((String) -> Void)?
    
    
    // MARK: - Input
    
    func viewDidLoad() {
        self.label?("Take a picture of your recipe")
        self.timePlaceholder?("30 min")
        self.categoryPlaceholder?("Veggie")
        self.yieldPlaceholder?("4")
        self.titlePlaceholder?("Mushroom Risotto")
        self.ingredientsPlaceholder?("40 g Parmesan cheese")
        self.metohdPlaceholder?("Put 50g dried porcini mushrooms into ...")
        self.saveButton?("Save")
    }
    
    func didPressSaveButton(titleTextField: String, ingredientTextField: String, methodTextField: String, timeTextField: String, dietCategoryTextField: String, yieldTextField: String) {
        
        guard !titleTextField.isEmpty && !ingredientTextField.isEmpty && !methodTextField.isEmpty && !timeTextField.isEmpty  && !dietCategoryTextField.isEmpty && !yieldTextField.isEmpty else {
            delegate?.displayAlert(for: .itemEmpty)
            return }
        
        repository.didPressSaveButton(creation: CreationItem(image: imageData, name: titleTextField, ingredient: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField))
        
        self.creationDisplayed?([CreationItem(image: imageData, name: titleTextField, ingredient: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField)])
        
        self.delegate?.didPressSaveButton(creation: CreationItem(image: imageData, name: titleTextField, ingredient: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField))
    }
    
    func didPressAddPhoto(imageAdded: Data?) {
        imageData = imageAdded
    }

    // Alert
    
    func restrictedCase() {
        delegate?.displayAlert(for: .restricted)
    }
    
    func denied() {
        delegate?.displayAlert(for: .denied)
    }
    
}
