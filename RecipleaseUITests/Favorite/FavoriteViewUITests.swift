//
//  FavoriteViewUITests.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

class FavoriteViewUITests: UITestCase, RootViewStarting, FavoriteViewVerifying {
    
    func test_Given_FavoriteView_When_NoRecipe_Then_Alert() {
        // Show view
        showFavoriteView()
        // Wait
        _ = noRecipeFound.waitForExistence(timeout: 1)
        // Check Alert
        XCTAssertTrue(noRecipeFound.exists)
    }
}

