//
//  SavingCreationViewUITests.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

class SavingCreationViewUITests: UITestCase, RootViewStarting, SavingCreationViewVerifying {

    // MARK: - View

    func test_VerifyingSavingCreationView() {
        // Show view
        showSavingCreationView()
        // Wait
        savingCreationViewWaitForExistence()
        // Check view
        XCTAssertTrue(savingCreationViewExists())
    }

    func test_Given_SavingCreationView_When_AddPhotoTap_Then_Alert() {
        // Show view
        showSavingCreationView()
        // Action
        _ = addPhotoButton.waitForExistence(timeout: 1)
        addPhotoButton.tap()
        // Wait
        sourceAuthorizationWaitForExistence()
        // Check alert
        XCTAssertTrue(sourceAuthorizationViewExists())
    }

    func test_Given_SavingCreation_When_SaveButtonTap_Then_Alert() {
        // Show view
        showSavingCreationView()
        // Wait
        _ = saveButton.waitForExistence(timeout: 1)
        saveButton.tap()
        // Check view
        _ = fillItemAlert.waitForExistence(timeout: 1)
        XCTAssertTrue(fillItemAlert.exists)
    }
}

