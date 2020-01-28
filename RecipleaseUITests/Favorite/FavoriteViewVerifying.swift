//
//  FavoriteViewVerifying.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//


import XCTest

protocol FavoriteViewVerifying {
    
    func showFavoriteView()
    
    var noRecipeFound: XCUIElement { get }
}

extension FavoriteViewVerifying {
    
    func showFavoriteView() {
        let homeSearchViewUITests = HomeSearchViewUITests()
        homeSearchViewUITests.test_goTo_FavoriteView()
    }
    
    var noRecipeFound: XCUIElement {
        return XCUIApplication().alerts["No recipe found yet"].scrollViews.otherElements.staticTexts["No recipe found yet"]
    }
}
