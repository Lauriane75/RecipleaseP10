//
//  RootViewStarting.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest
protocol RootViewStarting: StartupConfigurable, AppStarting {

    func startRootView()
}

extension RootViewStarting {

    func startRootView() {
        // Use AppStarting to start the app
        startApp()
    }

    func configureStartup() {
        startRootView()
    }
}
