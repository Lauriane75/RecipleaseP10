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

//Optional(11314165 bytes)

class MockSavingCreationRepository: SavingCreationRepositoryType {


    var creationItem: CreationItem?
    var isSuccess = true

    func didPressSaveButton(creation: CreationItem) {
    }

    func didPressRemoveCreation(titleCreation: String) {
    }
}

class SavingCreationViewModelTests: XCTestCase {

    let delegate = MockSavingCreationViewModelDelegate()
    let repository = MockSavingCreationRepository()

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
            XCTAssertEqual(text, "Take a picture of your recipe")
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

        let expectedResult = CreationItem(image: Optional(11314165) as! Data?, name: "Mushroom risotto", ingredient: "rice", method: "boil the rice into water", time: "30", category: "Veggie", yield: "4")

        repository.creationItem = expectedResult

        viewModel.viewDidLoad()

        viewModel.didPressSaveButton(titleTextField: "Mushroom risotto", ingredientTextField: "rice", methodTextField: "boil the rice into water", timeTextField: "30", dietCategoryTextField: "Veggie", yieldTextField: "4")

        viewModel.didPressAddPhoto(imageAdded: Optional(11314165) as! Data?)

        viewModel.viewDidLoad()

        viewModel.creationDisplayed = { creation in
            XCTAssertEqual(creation, [expectedResult])
        }
    }

//    self.creationDisplayed?([CreationItem(image: imageData, name: titleTextField, ingredient: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField)])
//
//    self.delegate?.didPressSaveButton(creation: CreationItem(image: imageData, name: titleTextField, ingredient: ingredientTextField, method: methodTextField, time: timeTextField, category: dietCategoryTextField, yield: yieldTextField))

}
