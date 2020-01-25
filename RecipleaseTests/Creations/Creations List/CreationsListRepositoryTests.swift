//
//  CreationsListRepositoryTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 25/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest
@testable import Reciplease

class CreationsListRepositoryTests: XCTestCase {

    let creation = [CreationItem(image: Optional(11314165) as! Data?, name: "Mushroom risotto", ingredient: "rice", method: "boil the rice into water", time: "30", category: "Veggie", yield: "4")]

    func test_Given_CreationsListRepository_When_ItsCalled_Then_DataIsCorrectlyReturned() {

        let repository = CreationsListRepository()

        guard let bundleMainPath = Bundle.main.path(forResource: "FakeRecipes", ofType: "json") else { return }

        let url = URL(fileURLWithPath: bundleMainPath)

        let expectation1 = self.expectation(description: "Returned not nil")

        let expectation2 = self.expectation(description: "Returned correctly")

        repository.getCreations { (creations) in
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }


}

