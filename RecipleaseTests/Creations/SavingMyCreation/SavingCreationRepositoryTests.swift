//
//  SavingCreationRepositoryTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 25/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest
@testable import Reciplease

class SavingCreationRepositoryTests: XCTestCase {
    
    let expectedResult = CreationItem(image: "11314165".data(using: .utf8), name: "Mushroom risotto", ingredient: "rice", method: "boil the rice into water", time: "30", category: "Veggie", yield: "4")
    
    let repository = SavingCreationRepository()
    
    func test_Given_SavingCreationRepository_When_didPressSaveButton_Then_CreationIsSaved() {
        
        let expectation = self.expectation(description: "CreationIsSaved")
        
        repository.didPressSaveButton(creation: expectedResult)
        expectation.fulfill()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func test_Given_SavingCreationRepositor_When_didPressRemoveCreation_Then_CreationIsDeleted() {
        
        let expectation = self.expectation(description: "CreationIsDeleted")
        
        repository.didPressRemoveCreation(titleCreation: expectedResult.name)
        expectation.fulfill()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

