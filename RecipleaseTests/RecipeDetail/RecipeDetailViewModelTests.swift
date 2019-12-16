//
//  RecipeDetailViewModelTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 16/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import XCTest
@ testable import Reciplease

final class MockRecipeDetailRepository: RecipeDetailRepositoryType {
    
    var favoriteState = false
    
    func didPressSelectFavoriteRecipe(recipe: RecipeItem) {
        favoriteState = true
    }
    
    func verifyingFavoriteState(recipeName: String, completion: (Bool) -> Void) {
    }
    
    func didPressRemoveFavoriteRecipe(recipeName: String) {
        favoriteState = false
    }
}

class RecipeDetailViewModelTests: XCTestCase {
    
    let recipe = RecipeItem(name: "Lemon Sparkler", imageName: "https://www.edamam.com/web-img/ce3/ce3d3cd4befd6690b6e7bef84e0e9c45.jpg", url: "https://www.marthastewart.com/1154944/lemon-sparkler", ingredient: ["1 tablespoon Galliano", "1 tablespoon fresh lemon juice", "1 tablespoon orange-flavored liqueur, such as Cointreau", "1/2 cup club soda", "1/2 teaspoon chopped fresh lemon balm or lemon verbena (optional), plus leaves for garnish", "1 lemon slice, for garnish"], time: 0, yield: 2, dietLabels: ["Low-Fat"])
    
    let mockRepository = MockRecipeDetailRepository()
    
    let alertDelegate = MockAlertDelegate()
    
    func test_Given_RecipeDetailViewModel_When_ViewDidLoad_Then_ReactivePropertiesAreDisplayed() {
        
        let viewModel = RecipeDetailViewModel(repository: mockRepository, recipe: recipe, alertDelegate: alertDelegate)
        
        let expectation1 = self.expectation(description: "Displayed recipeDisplayed")
        let expectation2 = self.expectation(description: "Displayed image")
        let expectation3 = self.expectation(description: "Displayed yieldLabel")
        let expectation4 = self.expectation(description: "Displayed recipeButton")
        let expectation5 = self.expectation(description: "Displayed timeLabel")
        let expectation6 = self.expectation(description: "Displayed dietLabels")
        
        
        viewModel.recipeDisplayed = { item in
            XCTAssertEqual(item, (self.recipe))
            expectation1.fulfill()
        }
        viewModel.image = { image in
            XCTAssertEqual(image, (self.recipe.imageName))
            expectation2.fulfill()
        }
        viewModel.yieldLabel = { text in
            XCTAssertEqual(text, "\(self.recipe.yield)")
            expectation3.fulfill()
        }
        viewModel.nameRecipeButton = { text in
            XCTAssertEqual(text, "Lemon Sparkler")
            expectation4.fulfill()
        }
        viewModel.timeLabel = { time in
            XCTAssertEqual(time, ("30 min"))
            expectation5.fulfill()
        }
        viewModel.dietLabel = { time in
            XCTAssertEqual(time, ("Low-Fat"))
            expectation6.fulfill()
        }
        
        viewModel.viewDidLoad()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_Given_RecipeDetailViewModel_When_VerifyingFavoriteState_Then_StateIsCorrectlyDisplayed() {
        
        let repository = RecipeDetailRepository()
        
        let viewModel = RecipeDetailViewModel(repository: repository, recipe: recipe, alertDelegate: alertDelegate)
        
        let expectation1 = self.expectation(description: "Displayed state")
        let expectation2 = self.expectation(description: "Verifying state")
        
        
        viewModel.favoriteState = { state in
            XCTAssertEqual(state, true)
            expectation1.fulfill()
        }
        
        viewModel.viewDidLoad()
        repository.didPressSelectFavoriteRecipe(recipe: recipe)
        
        repository.verifyingFavoriteState(recipeName: recipe.name) { (state) in
            XCTAssertEqual(state, true)
            expectation2.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
//    func test_Given_ViewModel_When_didPPressSafariButton_Then() {
//        
//        let repository = RecipeDetailRepository()
//        
//        let viewModel = RecipeDetailViewModel(repository: repository, recipe: recipe, alertDelegate: alertDelegate)
//        
//        let expectation1 = self.expectation(description: "Displayed state")
//        let expectation2 = self.expectation(description: "Verifying state")
//        
//        
//        viewModel.didPPressSafariButton() = { url in
//            XCTAssertEqual(url, recipe.url)
//            expectation1.fulfill()
//        }
//        
//        viewModel.viewDidLoad()
//        viewModel.didPPressSafariButton()
//        
//        repository.verifyingFavoriteState(recipeName: recipe.name) { (state) in
//            XCTAssertEqual(state, true)
//            expectation2.fulfill()
//        }
//        
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
    
}
