//
//  RecipesViewVerifying.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

protocol RecipesViewVerifying {
    // Show recipes view
    func showRecipesView()

}

extension RecipesViewVerifying {

    func showRecipesView() {
        let homeSearchViewUITests = HomeSearchViewUITests()
        homeSearchViewUITests.test_goTo_recipesView()
    }
}


