//
//  CreationDetailViewModelTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 25/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//


import XCTest
@ testable import Reciplease


final class MockCreationDetailViewModelDelegate: CreationDetailViewModelDelegate {

    var alert: AlertType? = nil

    func displayAlert(for type: AlertType) {
        self.alert = type
    }

    func showCreationsListView() {

    }

    func selectCreation(creation: CreationItem) {

    }
}

final class MockSavingCreationRepo: SavingCreationRepositoryType {
    func didPressSaveButton(creation: CreationItem) {

    }

    func didPressRemoveCreation(titleCreation: String) {

    }


}

class CreationDetailViewModelTests: XCTestCase {

    let creation = CreationItem(image: Optional(11314165) as! Data?, name: "Mushroom risotto", ingredient: "rice", method: "boil the rice into water", time: "30", category: "Veggie", yield: "4")

    let repository = MockSavingCreationRepo()

    let delegate = MockCreationDetailViewModelDelegate()

    func test_Given_ViewModel_When_ViewDidLoad_Then_ReactivePropertiesAreDisplayed() {

        let viewModel = CreationDetailViewModel(repository: repository, delegate: delegate, creation: creation)

        let expectation1 = self.expectation(description: "Displayed creationDisplayed")
        let expectation2 = self.expectation(description: "Displayed titleLabel")
        let expectation3 = self.expectation(description: "Displayed ingredientsAndMethod")
        let expectation4 = self.expectation(description: "Displayed timeLabel")
        let expectation5 = self.expectation(description: "Displayed dietLabel")
        let expectation6 = self.expectation(description: "Displayed yieldLabel")


        viewModel.creationDisplayed = { creation in
            XCTAssertEqual(creation, ([self.creation]))
            expectation1.fulfill()
        }
        viewModel.titleLabel = { text in
            XCTAssertEqual(text, (self.creation.name))
            expectation2.fulfill()
        }
        viewModel.ingredientsAndMethod = { text in
            XCTAssertEqual(text, "\(self.creation.ingredient)\(self.creation.method)")
            expectation3.fulfill()
        }
        viewModel.timeLabel = { text in
            XCTAssertEqual(text, (self.creation.time))
            expectation4.fulfill()
        }
        viewModel.dietLabel = { text in
            XCTAssertEqual(text, (self.creation.category))
            expectation5.fulfill()
        }
        viewModel.yieldLabel = { text in
            XCTAssertEqual(text, (self.creation.yield))
            expectation6.fulfill()
        }
        viewModel.viewDidLoad()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

}
