//
//  RecipesViewModelTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 16/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import XCTest
@ testable import Reciplease

// MARK: - Mock

final class MockRecipesViewModelDelegate: RecipesViewModelDelegate {
    
    var alert: AlertType? = nil
    
    var recipe: RecipeItem? = nil
    
    func selectRecipe(recipe: RecipeItem) {
        self.recipe = recipe
    }
    
    func displayRecipesAlert(for type: AlertType) {
        self.alert = type
    }
}

// MARK: - Tests

class MockRecipesRepository: RecipesRepositoryType {
    
    var recipeItem: [RecipeItem]?
    var isSuccess = true
    
    func getRecipes(url: URL, success: @escaping (Result<[RecipeItem]>) -> Void, error: @escaping (String) -> Void) {
        if let recipeItem = recipeItem {
            success(.success(value: recipeItem))
        } else if isSuccess == false {
            error("Error")
        }
    }
}

class RecipesViewModelTests: XCTestCase {
    
    let delegate = MockRecipesViewModelDelegate()
    let repository = MockRecipesRepository()
    
    let expectedResult = RecipeItem(name: "Lemon Sorbet", imageName: "https://www.edamam.com/web-img/78e/78ef0e463d0aadbf2caf7b6237cd5f12.jpg", url: "http://www.bbcgoodfood.com/recipes/4583/", ingredient: ["500.0g caster sugar", "1 lemon , unwaxed, zested", "250 ml lemon juice (6-8 lemons)"], time: 0, yield: 6, category: ["Low-Fat"])
    
    func test_Given_RecipesViewModel_When_viewWillAppear_Then_recipesDisplayed() {
        
        let viewModel = RecipesViewModel(delegate: delegate, repository: repository, ingredients: "")
        
        repository.recipeItem = [expectedResult]
        
        let expectation = self.expectation(description: "Displayed recipesDisplayed")
        
        var counter = 0
        
        viewModel.recipesDisplayed = { recipe in
            if counter == 1 {
                XCTAssertEqual(recipe, [self.expectedResult])
                expectation.fulfill()
                
            }
            counter += 1
        }
        
        viewModel.viewWillAppear()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func test_Given_RecipesViewModel_When_viewWillAppear_Then_activityIndicatorIsDisplayed() {
        
        let viewModel = RecipesViewModel(delegate: delegate, repository: repository, ingredients: "")
        
        repository.recipeItem = [expectedResult]
        
        let expectation = self.expectation(description: "Displayed recipesDisplayed")
        
        var counter = 0
        
        viewModel.activityIndicatorIsLoading = { state in
            if counter == 1 {
                XCTAssertEqual(state, false)
                expectation.fulfill()
            }
            counter += 1
        }
        
        viewModel.viewWillAppear()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func test_Given_RecipesViewModel_When_didSelectRecipe_Then_expectedResult() {
        
        let viewModel = RecipesViewModel(delegate: delegate, repository: repository, ingredients: "")
        
        repository.recipeItem = [expectedResult]
        
        viewModel.viewWillAppear()
        viewModel.didSelectRecipe(recipe: self.expectedResult)
        
        XCTAssertEqual(delegate.recipe, self.expectedResult)
    }
    
    func test_Given_RecipesViewModel_When_NoService_Then_Alert() {
        
        let viewModel = RecipesViewModel(delegate: delegate, repository: repository, ingredients: "")
        
        repository.isSuccess = false
        
        viewModel.viewWillAppear()
        viewModel.didSelectRecipe(recipe: self.expectedResult)
        
        XCTAssertEqual(delegate.alert, .errorService)
    }
}
