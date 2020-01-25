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

class SavingCreationViewModelTests: XCTestCase {
//
//    func test_Given_HomeViewModel_When_ViewDidLoad_Then_ReactivePropertiesAreDiplayed() {
//
//        let delegate = MockSearchHomeViewModelDelegate()
//
//        let viewModel = SearchHomeViewModel(delegate: delegate)
//
//        let expectation1 = self.expectation(description: "Diplayed titleLabel")
//        let expectation2 = self.expectation(description: "Diplayed placeHolderTextField")
//        let expectation3 = self.expectation(description: "Diplayed addButton")
//        let expectation4 = self.expectation(description: "Diplayed ingredientListLabel")
//        let expectation5 = self.expectation(description: "Diplayed clearButton")
//        let expectation6 = self.expectation(description: "Diplayed searchButton")
//        let expectation7 = self.expectation(description: "Diplayed searchButtonIsHidden")
//
//        viewModel.titleLabel = { text in
//            XCTAssertEqual(text, "What's in your fridge?")
//            expectation1.fulfill()
//        }
//
//        viewModel.placeHolderTextField = { text in
//            XCTAssertEqual(text, "Lemon, Sugar, Honey ...")
//            expectation2.fulfill()
//        }
//
//        viewModel.addButton = { text in
//            XCTAssertEqual(text, "+")
//            expectation3.fulfill()
//        }
//
//        viewModel.listTitleLabel = { text in
//            XCTAssertEqual(text, "In your fridge :")
//            expectation4.fulfill()
//        }
//
//        viewModel.clearButton = { text in
//            XCTAssertEqual(text, "x")
//            expectation5.fulfill()
//        }
//
//        viewModel.searchButton = { text in
//            XCTAssertEqual(text, "Go !")
//            expectation6.fulfill()
//        }
//
//        viewModel.searchButtonIsHidden = { state in
//            XCTAssertEqual(state, true)
//            expectation7.fulfill()
//        }
//        viewModel.viewDidLoad()
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
//
//    func test_Given_ViewModel_When_didPressAdd_Then_ingredientsIsDisplayed() {
//
//        let delegate = MockSearchHomeViewModelDelegate()
//
//        let viewModel = SearchHomeViewModel(delegate: delegate)
//
//        viewModel.viewDidLoad()
//        viewModel.didPressAdd(ingredientSelected: "lemon")
//
//        viewModel.ingredients = { text in
//            XCTAssertEqual(text, ["lemon"])
//        }
//    }
//
//    func test_Given_ViewModel_When_didPressAddAnddidPressClear_Then_IngredientsIsEmpty() {
//
//        let delegate = MockSearchHomeViewModelDelegate()
//
//        let viewModel = SearchHomeViewModel(delegate: delegate)
//
//        viewModel.viewDidLoad()
//        viewModel.didPressAdd(ingredientSelected: "eggs")
//        viewModel.didPressClear()
//
//        viewModel.ingredients = { text in
//            XCTAssertEqual(text, [""])
//        }
//
//    }
//
//    func test_Given_ViewModel_When_didPressAdd_Then_SearchButtonIsDisplayed() {
//
//        let delegate = MockSearchHomeViewModelDelegate()
//
//        let viewModel = SearchHomeViewModel(delegate: delegate)
//
//        let firstExpectation = self.expectation(description: "Displayed SearchButton")
//        let secondExpectation = self.expectation(description: "Displayed SearchButton2")
//
//
//        viewModel.searchButtonIsHidden = { state in
//            XCTAssertEqual(state, true)
//            firstExpectation.fulfill()
//        }
//
//        viewModel.viewDidLoad()
//
//        viewModel.searchButtonIsHidden = { state in
//            XCTAssertEqual(state, false)
//            secondExpectation.fulfill()
//        }
//
//        viewModel.didPressAdd(ingredientSelected: "chocolate")
//
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
//
//    func test_Given_ViewModel_When_didPressClear_Then_Alert() {
//
//        let delegate = MockSearchHomeViewModelDelegate()
//
//        let viewModel = SearchHomeViewModel(delegate: delegate)
//
//        viewModel.viewDidLoad()
//        viewModel.didPressAdd(ingredientSelected: "eggs")
//        viewModel.didPressClear()
//
//        XCTAssertEqual(delegate.alert, .errorIngredientListEmpty)
//    }
//
//    func test_Given_ViewModel_When_didPressSearchForRecipes_Then_DelegateIsCalled() {
//
//        let delegate = MockSearchHomeViewModelDelegate()
//
//        let viewModel = SearchHomeViewModel(delegate: delegate)
//
//        viewModel.viewDidLoad()
//        viewModel.didPressAdd(ingredientSelected: "eggs")
//        viewModel.didPressSearchForRecipes()
//
//        XCTAssertEqual(delegate.ingredient, "eggs")
//    }
//
//    func test_Given_ViewModel_When_didPressCreateRecipe_Then_DelegateIsCalled() {
//
//        let delegate = MockSearchHomeViewModelDelegate()
//
//        let viewModel = SearchHomeViewModel(delegate: delegate)
//
//        viewModel.viewDidLoad()
//        viewModel.didPressCreateRecipe()
//
////        XCTAssertEqual(delegate.showCreateMyRecipeView())
//    }
}

