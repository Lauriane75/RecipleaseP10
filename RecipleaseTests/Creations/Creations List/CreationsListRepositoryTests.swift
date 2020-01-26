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

     let expectedResult = [CreationItem(image: "11314165".data(using: .utf8), name: "Mushroom risotto", ingredient: "rice", method: "boil the rice into water", time: "30", category: "Veggie", yield: "4")]

    let repository = CreationsListRepository()

    func test_Given_CreationsListRepository_When_ItsCalled_Then_DataIsCorrectlyReturned() {

        let repository = CreationsListRepository()

        repository.getCreations { (creations) in

//        XCTAssertEqual(creations, self.expectedResult)
        }
    }


}

