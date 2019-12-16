//
//  RecipesViewModelTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 16/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import XCTest
@ testable import Reciplease

final class MockAlertDelegate: AlertDelegate {
    func displayAlert(type: AlertType) {
        print("alert")
    }
}

class MockRecipesRepository: RecipesRepositoryType {
    
    var recipeItem: [RecipeItem]?
    
    func getRecipes(url: URL, success: @escaping (Result<[RecipeItem]>) -> Void, onError: @escaping (String) -> Void) {
        if let recipeItem = recipeItem {
            success(.success(value: recipeItem))
        } else {
            onError("Error")
        }
    }
}

class RecipesViewModelTests: XCTestCase {
    
    let delegate = MockSearchCoordinator()
    let alertDelegate = MockAlertDelegate()
    let repository = MockRecipesRepository()
    
    
    func test_Given_RecipesViewModel_When_viewWillAppear_Then_ReactivePropertiesAreDisplayed() {
        
        let viewModel = RecipesViewModel(delegate: delegate, alertDelegate: alertDelegate, repository: repository, ingredients: "")
        
        let expectedResult = [RecipeItem(name: "Lemon Sorbet", imageName: "https://www.edamam.com/web-img/78e/78ef0e463d0aadbf2caf7b6237cd5f12.jpg", url: "http://www.bbcgoodfood.com/recipes/4583/", ingredient: ["500.0g caster sugar", "1 lemon , unwaxed, zested", "250 ml lemon juice (6-8 lemons)"], time: 0, yield: 6, dietLabels: ["Low-Fat"])]
        
        repository.recipeItem = expectedResult
        
        let expectation = self.expectation(description: "Displayed recipesDisplayed")
        
        var counter = 0
        
        viewModel.recipesDisplayed = { recipe in
            if counter == 1 {
                print(recipe)
                XCTAssertEqual(recipe, expectedResult)
                expectation.fulfill()
                
            }
            counter += 1
        }
        
        viewModel.viewWillAppear()
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
}
