//
//  HomeViewModelTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 16/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import XCTest
@ testable import Reciplease

class MockSearchCoordinator: HomeViewModelDelegate, RecipesViewModelDelegate {
    func didSelectIngredient(ingredient: String) {
    }
    
    func errorNoRecipeFound(for type: AlertType) {
    }
    
    func selectRecipe(recipe: RecipeItem) {
    }
    
    func error(for type: AlertType) {
    }
}

class HomeViewModelTests: XCTestCase {
        
    func test_Given_HomeViewModel_When_ViewDidLoad_Then_ReactivePropertiesAreDiplayed() {
        
        let delegate: HomeViewModelDelegate? = MockSearchCoordinator()
        
        let viewModel = HomeViewModel(delegate: delegate, alertDelegate: nil)
        
        let expectation1 = self.expectation(description: "Diplayed titleLabel")
        let expectation2 = self.expectation(description: "Diplayed placeHolderTextField")
        let expectation3 = self.expectation(description: "Diplayed addButton")
        let expectation4 = self.expectation(description: "Diplayed ingredientListLabel")
        let expectation5 = self.expectation(description: "Diplayed clearButton")
        let expectation6 = self.expectation(description: "Diplayed searchButton")
        let expectation7 = self.expectation(description: "Diplayed searchButtonIsHidden")
        
        viewModel.titleLabel = { text in
            XCTAssertEqual(text, "What's in your fridge?")
            expectation1.fulfill()
        }
        
        viewModel.placeHolderTextField = { text in
            XCTAssertEqual(text, "Lemon, Sugar, Honey ...")
            expectation2.fulfill()
        }
        
        viewModel.addButton = { text in
            XCTAssertEqual(text, "+")
            expectation3.fulfill()
        }
        
        viewModel.listTitleLabel = { text in
            XCTAssertEqual(text, "In your fridge :")
            expectation4.fulfill()
        }
        
        viewModel.clearButton = { text in
            XCTAssertEqual(text, "x")
            expectation5.fulfill()
        }
        
        viewModel.searchButton = { text in
            XCTAssertEqual(text, "Go !")
            expectation6.fulfill()
        }
        
        viewModel.searchButtonIsHidden = { state in
            XCTAssertEqual(state, true)
            expectation7.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    // question search button is hidden
    func test_Given_ViewModel_When_didPressAdd_Then_ingredientsIsDisplayed() {
        
        let delegate: HomeViewModelDelegate? = MockSearchCoordinator()
        
        let viewModel = HomeViewModel(delegate: delegate, alertDelegate: nil)
        
        let expectation1 = self.expectation(description: "Diplayed ingredient")
        
        let expectation2 = self.expectation(description: "Diplayed searchButtonIsHidden")
        
        var counter1 = 0
        
        viewModel.ingredients = { text in
            if counter1 == 1 {
                XCTAssertEqual(text, ["lemon"])
                expectation1.fulfill()
            }
            counter1 += 1
        }
        
        var counter2 = 0
        
        viewModel.searchButtonIsHidden = { state in
            if counter2 == 1 {
                XCTAssertEqual(state, false)
                expectation2.fulfill()
            }
            counter2 += 1
        }
                
        viewModel.viewDidLoad()
        viewModel.didPressAdd(ingredientSelected: "lemon")

        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    func test_Given_ViewModel_When_didPressAddAnddidPressClear_Then_IngredientsIsEmpty() {
        
        let delegate: HomeViewModelDelegate? = MockSearchCoordinator()
        
        let viewModel = HomeViewModel(delegate: delegate, alertDelegate: nil)
        
        let expectation = self.expectation(description: "Ingredient is empty")
        
        var counter = 0
        
        viewModel.ingredients = { text in
            if counter == 1 {
                XCTAssertEqual(text, [""])
                expectation.fulfill()
            }
            counter += 1
        }
        
        viewModel.didPressAdd(ingredientSelected: "eggs")
        viewModel.didPressClear()
        
        viewModel.viewDidLoad()
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    func test_Given_ViewModel_When_didPressAdd_Then_SearchButtonIsDisplayed() {
        
        let delegate: HomeViewModelDelegate? = MockSearchCoordinator()
        
        let viewModel = HomeViewModel(delegate: delegate, alertDelegate: nil)
        
        let expectation = self.expectation(description: "Displayed SearchButton")
        
        var counter = 0
        
        viewModel.searchButtonIsHidden = { state in
            if counter == 1 {
                XCTAssertEqual(state, false)
                expectation.fulfill()
            }
            counter += 1
        }
        
        viewModel.viewDidLoad()
        viewModel.didPressAdd(ingredientSelected: "chocolate")
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
}
