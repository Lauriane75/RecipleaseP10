//
//  UITestCase.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

class UITestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        // If the test is StartupConfigurable test, then call configureStartup()
        (self as? StartupConfigurable)?.configureStartup()
    }
}
