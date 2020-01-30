//
//  RecipeDetailViewModelTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 16/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//
import XCTest
@ testable import Reciplease

final class MockRecipeDetailViewModelDelegate: RecipeDetailViewModelDelegate {
    
    var alert: AlertType? = nil
    
    func displayAlert(for type: AlertType) {
        self.alert = type
    }
}

final class MockRecipeDetailRepository: RecipeDetailRepositoryType {
    
    func didPressSelectFavoriteRecipe(recipe: RecipeItem, image: String) {
    }
    
    func verifyingFavoriteState(recipeName: String, completion: (Bool) -> Void) {
    }
    
    func didPressRemoveFavoriteRecipe(recipeName: String) {
    }
}

class RecipeDetailViewModelTests: XCTestCase {
    
    let recipe = RecipeItem(name: "Lemon Sparkler", imageName: "https://www.edamam.com/web-img/ce3/ce3d3cd4befd6690b6e7bef84e0e9c45.jpg", url: "https://www.marthastewart.com/1154944/lemon-sparkler", ingredient: ["1 tablespoon Galliano", "1 tablespoon fresh lemon juice", "1 tablespoon orange-flavored liqueur, such as Cointreau", "1/2 cup club soda", "1/2 teaspoon chopped fresh lemon balm or lemon verbena (optional), plus leaves for garnish", "1 lemon slice, for garnish"], time: 20, yield: 2, category: ["Low-Fat"])
    
    let repository = MockRecipeDetailRepository()
    
    func test_Given_ViewModel_When_ViewDidLoad_Then_ReactivePropertiesAreDisplayed() {
        
        let viewModel = RecipeDetailViewModel(repository: repository, recipe: recipe)
        
        let expectation1 = self.expectation(description: "Displayed recipeDisplayed")
        let expectation2 = self.expectation(description: "Displayed image")
        let expectation3 = self.expectation(description: "Displayed timeLabel")
        let expectation4 = self.expectation(description: "Displayed categoryLabel")
        let expectation5 = self.expectation(description: "Displayed yieldLabel")
        let expectation6 = self.expectation(description: "Displayed nameRecipeButton")
        let expectation7 = self.expectation(description: "Displayed navBarTitle")
        
        
        viewModel.recipeDisplayed = { item in
            XCTAssertEqual(item, (self.recipe))
            expectation1.fulfill()
        }
        viewModel.image = { image in
            XCTAssertEqual(image, (self.recipe.imageName))
            expectation2.fulfill()
        }
        viewModel.timeLabel = { time in
            XCTAssertEqual(time, "\(self.recipe.time) min")
            expectation3.fulfill()
        }
        viewModel.categoryLabel = { time in
            XCTAssertEqual(time, "Low-Fat")
            expectation4.fulfill()
        }
        viewModel.yieldLabel = { text in
            XCTAssertEqual(text, "\(self.recipe.yield)")
            expectation5.fulfill()
        }
        viewModel.nameRecipeButton = { text in
            XCTAssertEqual(text, self.recipe.name)
            expectation6.fulfill()
        }
        viewModel.navBarTitle = { text in
            XCTAssertEqual(text, "Detail Recipe")
            expectation7.fulfill()
        }
        
        viewModel.viewDidLoad()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func test_Given_ViewModel_When_didPressSelectFavoriteRecipe_Then_StateIsCorrectlyDisplayed() {
        
        let viewModel = RecipeDetailViewModel(repository: repository, recipe: recipe)
        
        viewModel.viewDidLoad()
        repository.didPressSelectFavoriteRecipe(recipe: recipe, image: recipe.imageName)
        
        viewModel.favoriteState = { state in
            XCTAssertEqual(state, true)
        }
        
        viewModel.favoriteImageState = { text in
            XCTAssertEqual(text, "star.fill")
        }
        
        repository.verifyingFavoriteState(recipeName: recipe.name) { (state) in
            XCTAssertEqual(state, true)
        }
    }
    
    
    func test_Given_ViewModel_When_didPressRemoveFavoriteRecipe_Then_StateIsCorrectlyDisplayed() {
        
        let viewModel = RecipeDetailViewModel(repository: repository, recipe: recipe)
        
        viewModel.viewDidLoad()
        repository.didPressRemoveFavoriteRecipe(recipeName: recipe.name)
        
        viewModel.favoriteState = { state in
            XCTAssertEqual(state, true)
        }
        
        viewModel.favoriteImageState = { text in
            XCTAssertEqual(text, "star.fill")
        }
        
        repository.verifyingFavoriteState(recipeName: recipe.name) { (state) in
            XCTAssertEqual(state, true)
        }
    }
    
}
