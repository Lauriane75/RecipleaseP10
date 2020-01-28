//
//  CreationsListViewModelTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 25/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import XCTest
@ testable import Reciplease

final class MockCreationsListViewModelDelegate: CreationsListViewModelDelegate {

    var alert: AlertType? = nil
    var creation: CreationItem? = nil

    func selectCreation(creation: CreationItem) {
        self.creation = creation
    }

    func displayAlert(for type: AlertType) {
        self.alert = type
    }
}


class MockCreationRepository: CreationRepositoryType {

    var creationItem: [CreationItem]?

    func didPressSaveCreation(creation: CreationItem) {
    }

    func getCreations(callback: @escaping ([CreationItem]) -> Void) {
        if let creationItem = creationItem {
            callback(creationItem)
        } else {
            callback([])
        }
    }

    func didPressRemoveCreation(titleCreation: String) {
    }
}

class CreationsListViewModelTests: XCTestCase {

    let delegate = MockCreationsListViewModelDelegate()

    let repository = MockCreationRepository()

    let expectedResult = CreationItem(image: "11314165".data(using: .utf8), name: "Mushroom risotto", ingredient: "rice", method: "boil the rice into water", time: "30", category: "Veggie", yield: "4")

    func test_Given_ViewModel_When_viewDidLoad_Then_ReactivePropertiesAreDisplayed() {

        let viewModel = CreationsListViewModel(repository: repository, delegate: delegate)

        viewModel.viewDidLoad()
        repository.creationItem = [expectedResult]

        viewModel.creationItem = { creation in

            XCTAssertEqual(creation, [self.expectedResult])
        }
    }

    func test_Given_ViewModel_When_didSelectCreation_Then_expectedResult() {

        let viewModel = CreationsListViewModel(repository: repository, delegate: delegate)

        viewModel.viewDidLoad()
        repository.creationItem = [expectedResult]
        viewModel.didSelectCreation(creation: expectedResult)

        XCTAssertEqual(delegate.creation, expectedResult)
    }

    func test_Given_ViewModel_When_didPressDeleteCreation_Then_creationItemIsNil() {

        let viewModel = CreationsListViewModel(repository: repository, delegate: delegate)

        viewModel.viewDidLoad()
        repository.creationItem = [expectedResult]
        repository.didPressRemoveCreation(titleCreation: expectedResult.name)

        viewModel.creationItem = { creation in

            XCTAssertEqual(creation, [])
        }
    }

    func test_Given_When_Then() {

        let viewModel = CreationsListViewModel(repository: repository, delegate: delegate)

        viewModel.viewDidLoad()

        viewModel.didSelectCreation(creation: expectedResult)

        XCTAssertEqual(delegate.creation, expectedResult)
    }

    func test_Given_ViewModel_When_NoCreation_Then_Alert() {

        let viewModel = CreationsListViewModel(repository: repository, delegate: delegate)

        viewModel.viewDidLoad()

        repository.didPressSaveCreation(creation: expectedResult)

        repository.didPressRemoveCreation(titleCreation: expectedResult.name)

        repository.getCreations(callback: { items in
            XCTAssertEqual(items, Optional([]))
        })

        XCTAssertEqual(delegate.alert, .noCreation)
    }
}
