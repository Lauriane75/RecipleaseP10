//
//  RecipesViewVerifying.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

protocol RecipesViewVerifying {

    func showRecipesView()

    func recipesViewWaitForExistence()
    func recipesViewExists() -> Bool

    // MARK: - Properties

    var navBarTitle: XCUIElement { get }
    var backButton: XCUIElement { get }
    var favoriteItem: XCUIElement { get }
    var searchItem: XCUIElement { get }
}

extension RecipesViewVerifying {

    func showRecipesView() {
        let homeSearchViewUITests = HomeSearchViewUITests()
        homeSearchViewUITests.test_goTo_recipesView()
    }

    func recipesViewWaitForExistence() {
        _ = navBarTitle.waitForExistence(timeout: 1)
        _ = backButton.waitForExistence(timeout: 1)
        _ = favoriteItem.waitForExistence(timeout: 1)
        _ = searchItem.waitForExistence(timeout: 1)
    }

    func recipesViewExists() -> Bool {
        return navBarTitle.exists
            && backButton.exists
            && favoriteItem.exists
            && searchItem.exists
    }

    // MARK: - Properties

    var navBarTitle: XCUIElement {
        return XCUIApplication().navigationBars["Recipes"].staticTexts["Recipes"]
    }
    var backButton: XCUIElement {
        return XCUIApplication().navigationBars["Recipes"].buttons["Back"]
    }
    var favoriteItem: XCUIElement {
        return XCUIApplication().tabBars.buttons["Favorites"]
    }
    var searchItem: XCUIElement {
        return XCUIApplication().tabBars.buttons["Search"]
    }
}
