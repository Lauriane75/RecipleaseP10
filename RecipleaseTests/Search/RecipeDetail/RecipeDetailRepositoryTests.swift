//
//  RecipeDetailRepositoryTests.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 16/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import XCTest
@testable import Reciplease

class RecipeDetailRepositoryTests: XCTestCase {

    let recipe = RecipeItem(name: "Lemon Salt Lemon Cupcakes", imageName: "https://www.edamam.com/web-img/12a/12ada1de7390e796f6babe36cf6bae38.jpg", url: "http://www.tarteletteblog.com/2011/10/recipe-gluten-free-lemon-salt-lemon.html", ingredient: ["1 stick unsalted butter, at room temperature", "1 cup sugar", "3 large eggs", "1½ cups Jeanne's gluten free all-purpose flour", "1 teaspoon baking powder", "½ teaspoon salt", "½ cup buttermilk", "zest and juice of one lemon", "3 egg yolks", "1/2 cup sugar", "1/4 cup water + 1 tablespoon lemon juice", "1 1/2 sticks unsalted butter, at room temperature", "zest of a lemon"], time: 0, yield: 16, category: [" "])

    let repository = RecipeDetailRepository(stack: CoreDataStack(modelName: "Reciplease", type: .test))

    func test_Given_RecipeDetailRepository_When_didPressSelectFavoriteRecipe_Then_RecipeIsFavorite() {

        let expectation = self.expectation(description: "Recipe is in favorite")

        repository.didPressSelectFavoriteRecipe(recipe: recipe, image: recipe.imageName)

        repository.verifyingFavoriteState(recipeName: recipe.name) { (state) in
            XCTAssertEqual(state, true)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func test_Given_RecipeDetailRepository_When_didPressRemoveFavoriteRecipe_Then_RecipeIsNotFavorite() {

        let expectation = self.expectation(description: "Recipe is not in favorite")

        repository.didPressRemoveFavoriteRecipe(recipeName: recipe.name)

        repository.verifyingFavoriteState(recipeName: recipe.name) {
            (state) in
            XCTAssertEqual(state, false)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
