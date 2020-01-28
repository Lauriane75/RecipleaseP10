//
//  SavingCreationViewVerifying.swift
//  RecipleaseUITests
//
//  Created by Lauriane Haydari on 28/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest

protocol SavingCreationViewVerifying {
    // Show view
    func showSavingCreationView()

}

extension SavingCreationViewVerifying {

    func showSavingCreationView() {
        let homeSearchViewUITests = HomeSearchViewUITests()
        homeSearchViewUITests.test_goTo_SavingCreationView()
    }
    
}
