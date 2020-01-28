//
//  RecipesViewUITests.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

class RecipesViewUITests: UITestCase, RootViewStarting, RecipesViewVerifying {
    
    // MARK: - View
    
    func test_VerifyingRecipesView() {
        // Show view
        showRecipesView()
        // Wait
        recipesViewWaitForExistence()
        // Check view
        XCTAssertTrue(recipesViewExists())
    }
}
