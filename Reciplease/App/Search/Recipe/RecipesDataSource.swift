//
//  ResultRecipesDataSource.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 03/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class RecipesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var recipes: [RecipeItem] = []
    var selectedRecipe: ((RecipeItem) -> Void)?
    
    // MARK: - DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as! RecipesTableViewCell
        cell.updateCell(with: recipes[indexPath.row])
        return cell
    }
    
    func updateCell (updatedRecipes: [RecipeItem]) {
        self.recipes = updatedRecipes
    }
    
    // MARK: - Delegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < recipes.count else { return }
        selectedRecipe?(recipes[indexPath.row])
        print("select")
    }
}

//import UIKit
//
//final class RecipesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
//
//    private var recipes: [RecipeItem] = []
//    var selectedRecipe: ((RecipeItem) -> Void)?
//
//    // MARK: - DataSource
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return recipes.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//         let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as! RecipesTableViewCell
//        cell.updateCell(with: recipes[indexPath.row])
//        return cell
//    }
//
//    func updateCell (updatedRecipes: [RecipeItem]) {
//        self.recipes = updatedRecipes
//    }
//
//    // MARK: - Delegate
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 250
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard indexPath.row < recipes.count else { return }
//        selectedRecipe?(recipes[indexPath.row])
//        print("select")
//    }
//}
//
