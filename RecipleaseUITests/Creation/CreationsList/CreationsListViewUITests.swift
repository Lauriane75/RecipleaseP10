//
//  CreationsListViewUITest.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

class CreationsListViewUITests: UITestCase, RootViewStarting, CreationsListViewVerifying {
    
    func testExample() {
        showCreationsListView()
        _ = noCreationFound.waitForExistence(timeout: 1)
        XCTAssertTrue(noCreationFound.exists)
    }
}
