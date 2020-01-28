//
//  SavingCreationViewVerifying.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

protocol SavingCreationViewVerifying {

    // MARK: - View
    
    func showSavingCreationView()

    func savingCreationViewWaitForExistence()

    func savingCreationViewExists() -> Bool

    func sourceAuthorizationWaitForExistence()

    func sourceAuthorizationViewExists() -> Bool

    // MARK: - Properties

    var navBarTitle: XCUIElement { get }
    var titleLabel: XCUIElement { get }
    var titleTextField: XCUIElement { get }
    var ingredientTextField: XCUIElement { get }
    var methodTextField: XCUIElement { get }
    var addPhotoButton: XCUIElement { get }
    var saveButton: XCUIElement { get }

    var photoSource: XCUIElement { get }
    var chooseSource: XCUIElement { get }
    var camera: XCUIElement { get }
    var library: XCUIElement { get }
    var fillItemAlert: XCUIElement { get }
}

extension SavingCreationViewVerifying {

    func showSavingCreationView() {
        let homeSearchViewUITests = HomeSearchViewUITests()
        homeSearchViewUITests.test_goTo_SavingCreationView()
    }

    func savingCreationViewWaitForExistence() {
        _ = navBarTitle.waitForExistence(timeout: 1)
        _ = titleLabel.waitForExistence(timeout: 1)
        _ = titleTextField.waitForExistence(timeout: 1)
        _ = ingredientTextField.waitForExistence(timeout: 1)
        _ = methodTextField.waitForExistence(timeout: 1)
        _ = addPhotoButton.waitForExistence(timeout: 1)
        _ = saveButton.waitForExistence(timeout: 1)
    }

    func savingCreationViewExists() -> Bool {
        return navBarTitle.exists
            && titleLabel.exists
            && titleTextField.exists
            && ingredientTextField.exists
            && methodTextField.exists
            && addPhotoButton.exists
            && saveButton.exists
    }

    func sourceAuthorizationWaitForExistence() {
        _ = photoSource.waitForExistence(timeout: 1)
        _ = chooseSource.waitForExistence(timeout: 1)
        _ = camera.waitForExistence(timeout: 1)
        _ = library.waitForExistence(timeout: 1)
    }

    func sourceAuthorizationViewExists() -> Bool {
        return photoSource.exists
            && chooseSource.exists
            && camera.exists
            && library.exists
    }

    // MARK: - Properties

    var navBarTitle: XCUIElement {
        return XCUIApplication().navigationBars["Create my recipe"].staticTexts["Create my recipe"]
    }

    var titleLabel: XCUIElement {
        return XCUIApplication().staticTexts["Add the picture of your recipe then fill every field"]
    }
    var titleTextField: XCUIElement {
        return XCUIApplication().textFields["Mushroom Risotto"]
    }
    var ingredientTextField: XCUIElement {
        return XCUIApplication().textFields["40 g Parmesan cheese"]
    }
    var methodTextField: XCUIElement {
        return XCUIApplication().textFields["Put 50g dried porcini mushrooms into ..."]
    }
    var addPhotoButton: XCUIElement {
        return XCUIApplication().buttons["photo.fill"]
    }
    var saveButton: XCUIElement {
        return XCUIApplication().buttons["Save"]
    }

    // Alert

    var photoSource: XCUIElement {
        return XCUIApplication().sheets["photo source"].scrollViews.otherElements.staticTexts["photo source"]
    }
    var chooseSource: XCUIElement {
        return XCUIApplication().sheets["photo source"].scrollViews.otherElements.staticTexts["choose a source"]
    }
    var camera: XCUIElement {
        return XCUIApplication().sheets["photo source"].scrollViews.otherElements.buttons["Camera"]
    }
    var library: XCUIElement {
        return XCUIApplication().sheets["photo source"].scrollViews.otherElements.buttons["Photo Library"]
    }
    var fillItemAlert: XCUIElement {
        return  XCUIApplication().alerts["You forgot to fill an item"].scrollViews.otherElements.staticTexts["You forgot to fill an item"]
    }
    
}
