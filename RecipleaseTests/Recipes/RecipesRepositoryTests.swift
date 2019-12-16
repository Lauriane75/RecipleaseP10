//
//  RecipeDetailViewModelTest.swift
//  RecipleaseTests
//
//  Created by Lauriane Haydari on 16/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import XCTest
@testable import Reciplease

class MockNetworkRequest: NetworkRequestType {
    
    func request<T>(type: T.Type, url: URL, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        do {
            let data = try Data(contentsOf: url)
            
            let jsonDecoder = JSONDecoder()
            guard let decodedData = try? jsonDecoder.decode(type.self, from: data ) else { return }
            completion(.success(value: decodedData))
        }
        catch {
            print(error)
        }
    }
}

class RecipesRepositoryTests: XCTestCase {
    
    func test_Given_RecipesRepository_When_ItsCalled_Then_DataIsCorrectlyReturned() {
        
        let network = MockNetworkRequest()
        
        let repository = RecipesRepository(requestType: .network, network: network)
        
        guard let bundleMainPath = Bundle.main.path(forResource: "FakeRecipes", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: bundleMainPath)
                
        let expectation1 = self.expectation(description: "Returned not nil")
        
        let expectation2 = self.expectation(description: "Returned correctly")
        
        repository.getRecipes(url: url, success: { (result) in
            switch result {
            case .success(value: let recipeItems):
                XCTAssertNotNil(recipeItems)
                expectation1.fulfill()
                
                XCTAssertEqual(recipeItems[0].name, "Lemon Sorbet")
                expectation2.fulfill()
                
                XCTAssertEqual(recipeItems[0].imageName, "https://www.edamam.com/web-img/ce3/ce3d3cd4befd6690b6e7bef84e0e9c45.jpg")
                XCTAssertEqual(recipeItems[0].url, "http://www.edamam.com/ontologies/edamam.owl#recipe_f00df78e779c210808de541c2a476a07")
                print(recipeItems[0].ingredient, ["1 tablespoon Galliano", "1 tablespoon fresh lemon juice", "1 tablespoon orange-flavored liqueur, such as Cointreau", "1/2 cup club soda", "1/2 teaspoon chopped fresh lemon balm or lemon verbena (optional), plus leaves for garnish", "1 lemon slice, for garnish"])
                XCTAssertEqual(recipeItems[0].time, 0)
                XCTAssertEqual(recipeItems[0].yield, 6)
                XCTAssertEqual(recipeItems[0].dietLabels, ["Low-Fat"])
                
            case .error(error: let error):
                print(error)
            }
        }) { (error) in
            print(error)
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }


}