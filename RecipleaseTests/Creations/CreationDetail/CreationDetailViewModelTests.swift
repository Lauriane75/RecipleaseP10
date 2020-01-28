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

    var didShowCreationListView = false
    var creationItem: CreationItem! = nil

    func showCreationsListView() {
        didShowCreationListView = true
    }
    
    func selectCreation(creation: CreationItem) {
        creationItem = creation
    }
}

final class MockSavingCreationRepo: CreationRepositoryType {

    func didPressSaveCreation(creation: CreationItem) {
    }

    func getCreations(callback: @escaping ([CreationItem]) -> Void) {
    }

    func didPressSaveButton(creation: CreationItem) {
        
    }
    
    func didPressRemoveCreation(titleCreation: String) {
    }
}

class CreationDetailViewModelTests: XCTestCase {
    
    
    let creation = CreationItem(image: "11314165".data(using: .utf8), name: "Mushroom risotto", ingredient: "rice", method: "boil the rice into water", time: "30", category: "Veggie", yield: "4")
    
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
        viewModel.ingredientsAndMethodLabel = { text in
            XCTAssertEqual(text, "\(self.creation.ingredient)\n\(self.creation.method)")
            expectation3.fulfill()
        }
        viewModel.timeLabel = { text in
            XCTAssertEqual(text, (self.creation.time))
            expectation4.fulfill()
        }
        viewModel.categoryLabel = { text in
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

    func testDidPressMyCreationsButton() {
        let viewModel = CreationDetailViewModel(repository: repository, delegate: delegate, creation: creation)

        viewModel.viewDidLoad()
        viewModel.didPressMyCreationsButton()

        XCTAssertTrue(delegate.didShowCreationListView)
    }

    func testdidPressDeleteCreationButton() {
        let viewModel = CreationDetailViewModel(repository: repository, delegate: delegate, creation: creation)

        viewModel.viewDidLoad()
        viewModel.didPressDeleteCreationButton()

        XCTAssertTrue(delegate.didShowCreationListView)
    }
}
