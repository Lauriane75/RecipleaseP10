//
//  CreationsListViewVerifying.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

protocol CreationsListViewVerifying {

    func showCreationsListView()

    var noCreationFound: XCUIElement { get }
}

extension CreationsListViewVerifying {

    func showCreationsListView() {
        let homeSearchViewUITests = HomeSearchViewUITests()
        homeSearchViewUITests.test_goTo_CreationsListView()
    }

    var noCreationFound: XCUIElement {
        return XCUIApplication().alerts["No creation saved yet"].scrollViews.otherElements.staticTexts["No creation saved yet"]
    }
}
