//
//  SavingCreationRepositoryTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 25/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest
@testable import Reciplease

class CreationRepositoryTests: XCTestCase {
    
    
    func test_Given_CreationsRepository_When_didPressSaveCreation_Then_DataIsCorrectlyReturned() {
        
        let expectedResult = [CreationItem(image: "11314165".data(using: .utf8),
                                           name: "Mushroom risotto",
                                           ingredient: "rice",
                                           method: "boil the rice into water",
                                           time: "30",
                                           category: "Veggie",
                                           yield: "4")]
        
        let stack = CoreDataStack(modelName: "Reciplease",
                                  type: .test)
        
        let creation = CreationItem(image: "11314165".data(using: .utf8),
                                    name: "Mushroom risotto",
                                    ingredient: "rice",
                                    method: "boil the rice into water",
                                    time: "30",
                                    category: "Veggie",
                                    yield: "4")
        
        let repository = CreationRepository(stack: stack)
        
        repository.didPressSaveCreation(creation: creation)
        
        repository.getCreations(callback: { items in
            XCTAssertEqual(items, expectedResult)
        })
    }
    
    func test_Given_CreationRepository_When_didPressRemoveCreation_Then_DataIsCorrectlyReturned() {
        
        let stack = CoreDataStack(modelName: "Reciplease",
                                  type: .test)
        
        let creation = CreationItem(image: "11314165".data(using: .utf8),
                                    name: "Mushroom risotto",
                                    ingredient: "rice",
                                    method: "boil the rice into water",
                                    time: "30",
                                    category: "Veggie",
                                    yield: "4")
        
        let repository = CreationRepository(stack: stack)
        
        repository.didPressSaveCreation(creation: creation)
        repository.didPressRemoveCreation(titleCreation: creation.name)
        
        repository.getCreations(callback: { items in
            XCTAssertEqual(items, Optional([]))
        })
    }
}
