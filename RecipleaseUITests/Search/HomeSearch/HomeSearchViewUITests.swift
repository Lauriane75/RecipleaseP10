//
//  HomeSearchViewUITests.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

class HomeSearchViewUITests: UITestCase, RootViewStarting, HomeSearchViewVerifying {

    // View

    func test_VerifyingHomeSearchView() {
        // Wait
        homeSearchViewWaitForExistence()
        // Check view
        XCTAssertTrue(homeSearchViewExists())
    }

    // Action

    func test_Given_homeSearchView_When_addIngredient_Then_goButtonExists() {
        // Fiil textfield
        _ = ingredientTextField.waitForExistence(timeout: 1)
        ingredientTextField.tap()
        ingredientTextField.typeText("lemon")
        // Add ingredient
        _ = addButton.waitForExistence(timeout: 1)
        addButton.tap()
        // Check go button
        _ = goButton.waitForExistence(timeout: 1)
        XCTAssertTrue(goButton.exists)
    }

    // Go to next view

    func test_goTo_recipesView() {
        // Fiil textfield
        _ = ingredientTextField.waitForExistence(timeout: 1)
        ingredientTextField.tap()
        ingredientTextField.typeText("lemon")
        // Add ingredient
        _ = addButton.waitForExistence(timeout: 1)
        addButton.tap()
        // Check go button
        _ = addLabel.waitForExistence(timeout: 1)
        addLabel.tap()
        _ = goButton.waitForExistence(timeout: 1)
        goButton.tap()
    }

    func test_goTo_SavingCreationView() {
        _ = createMyRecipeButton.waitForExistence(timeout: 1)
        createMyRecipeButton.tap()
    }


}
