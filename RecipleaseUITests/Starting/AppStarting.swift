//
//  AppStarting.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

protocol AppStarting {
    func startApp()
}

extension AppStarting {
    func startApp() {
        XCUIApplication().launch()
    }
}
