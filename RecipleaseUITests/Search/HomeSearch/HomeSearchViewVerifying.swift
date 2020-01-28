//
//  HomeSearchViewVerifying.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

protocol HomeSearchViewVerifying {

       func homeSearchViewWaitForExistence()
       func homeSearchViewExists() -> Bool

       // MARK: - Properties

    var titleLabel: XCUIElement { get }
    var addButton: XCUIElement { get }
    var addLabel: XCUIElement { get }
    var clearButton: XCUIElement { get }
    var clearLabel: XCUIElement { get }
    var ingredientTextField: XCUIElement { get }
    var createMyRecipeButton: XCUIElement { get }
    var goButton: XCUIElement { get }

}

extension HomeSearchViewVerifying {

    func homeSearchViewWaitForExistence() {
        _ = titleLabel.waitForExistence(timeout: 1)
        _ = addButton.waitForExistence(timeout: 1)
        _ = addLabel.waitForExistence(timeout: 1)
        _ = clearButton.waitForExistence(timeout: 1)
        _ = clearLabel.waitForExistence(timeout: 1)
        _ = ingredientTextField.waitForExistence(timeout: 1)
        _ = createMyRecipeButton.waitForExistence(timeout: 1)
    }

    func homeSearchViewExists() -> Bool {
        return titleLabel.exists
            && addButton.exists
            && addLabel.exists
            && clearButton.exists
            && clearLabel.exists
            && ingredientTextField.exists
            && createMyRecipeButton.exists
    }

    // MARK: - Properties

    var titleLabel: XCUIElement {
        return XCUIApplication().staticTexts["What's in your fridge?"]
    }
    var addButton: XCUIElement {
        return XCUIApplication().buttons["+"]
    }
    var addLabel: XCUIElement {
        return XCUIApplication().staticTexts["Add"]
    }
    var clearButton: XCUIElement {
        return XCUIApplication().buttons["x"]
    }
    var clearLabel: XCUIElement {
          return XCUIApplication().staticTexts["Clear"]
    }
    var ingredientTextField: XCUIElement {
        return XCUIApplication().textFields["Lemon, Sugar, Honey ..."]
    }
    var createMyRecipeButton: XCUIElement {
        return XCUIApplication().buttons["Create my recipe"]
    }
    var goButton: XCUIElement {
        return XCUIApplication().buttons["Go !"]
    }
}
