//
//  SavingCreationViewModelTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 25/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest
@ testable import Reciplease

class MockSavingCreationViewModelDelegate: SavingCreationViewModelDelegate {
    
    var alert: AlertType? = nil
    var creation: CreationItem? = nil
    
    func didPressSaveButton(creation: CreationItem) {
        self.creation = creation
    }
    
    func displayAlert(for type: AlertType) {
        self.alert = type
    }
}

class MockSavingCreationRepository: CreationRepositoryType {

    var creationItem: CreationItem?

    var isSuccess = true

    func didPressSaveCreation(creation: CreationItem) {
    }

    func getCreations(callback: @escaping ([CreationItem]) -> Void) {
    }
    
    func didPressSaveButton(creation: CreationItem) {
    }
    
    func didPressRemoveCreation(titleCreation: String) {
    }
}

class SavingCreationViewModelTests: XCTestCase {
    
    let delegate = MockSavingCreationViewModelDelegate()
    let repository = MockSavingCreationRepository()
    
    let expectedResult = CreationItem(image: "11314165".data(using: .utf8), name: "Mushroom risotto", ingredient: "rice", method: "boil the rice into water", time: "30", category: "Veggie", yield: "4")
    
    func test_Given_ViewModel_When_ViewDidLoad_Then_ReactivePropertiesAreDiplayed() {
        
        let viewModel = SavingCreationViewModel(delegate: delegate, repository: repository)
        
        let expectation1 = self.expectation(description: "Diplayed label")
        let expectation2 = self.expectation(description: "Diplayed timePlaceholder")
        let expectation3 = self.expectation(description: "Diplayed categoryPlaceholder")
        let expectation4 = self.expectation(description: "Diplayed yieldPlaceholder")
        let expectation5 = self.expectation(description: "Diplayed titlePlaceholder")
        let expectation6 = self.expectation(description: "Diplayed ingredientsPlaceholder")
        let expectation7 = self.expectation(description: "Diplayed metohdPlaceholder")
        let expectation8 = self.expectation(description: "Diplayed saveButton")
        
        
        viewModel.label = { text in
            XCTAssertEqual(text, "Add the picture of your recipe then fill every field")
            expectation1.fulfill()
        }
        
        viewModel.timePlaceholder = { text in
            XCTAssertEqual(text, "30 min")
            expectation2.fulfill()
        }
        
        viewModel.categoryPlaceholder = { text in
            XCTAssertEqual(text, "Veggie")
            expectation3.fulfill()
        }
        
        viewModel.yieldPlaceholder = { text in
            XCTAssertEqual(text, "4")
            expectation4.fulfill()
        }
        
        viewModel.titlePlaceholder = { text in
            XCTAssertEqual(text, "Mushroom Risotto")
            expectation5.fulfill()
        }
        
        viewModel.ingredientsPlaceholder = { text in
            XCTAssertEqual(text, "40 g Parmesan cheese")
            expectation6.fulfill()
        }
        
        viewModel.metohdPlaceholder = { state in
            XCTAssertEqual(state, "Put 50g dried porcini mushrooms into ...")
            expectation7.fulfill()
        }
        viewModel.saveButton = { state in
            XCTAssertEqual(state, "Save")
            expectation8.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_Given_ViewModel_When_didPressSaveButton_Then_creationDisplayed() {
        
        let viewModel = SavingCreationViewModel(delegate: delegate, repository: repository)
        
        repository.creationItem = expectedResult

        viewModel.didPressSaveButton(titleTextField: "Mushroom risotto", ingredientTextField: "rice", methodTextField: "boil the rice into water", timeTextField: "30", dietCategoryTextField: "Veggie", yieldTextField: "4")
        viewModel.didPressAddPhoto(imageAdded: "11314165".data(using: .utf8))
        viewModel.viewDidLoad()
        
        viewModel.creationDisplayed = { creation in
            XCTAssertEqual(creation, [self.expectedResult])
        }
    }

    func test_Given_ViewModel_When_didPressSaveButton_Then_AlertItemEmpty() {

        let viewModel = SavingCreationViewModel(delegate: delegate, repository: repository)

        viewModel.didPressSaveButton(titleTextField: "", ingredientTextField: "rice", methodTextField: "boil the rice into water", timeTextField: "30", dietCategoryTextField: "Veggie", yieldTextField: "4")

        XCTAssertEqual(delegate.alert, .itemEmpty)
    }
    
}
