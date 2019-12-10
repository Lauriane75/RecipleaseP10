//
//  RecipeDetailDataSource.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 10/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class RecipeDetailDataSource: NSObject, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = UITableViewCell()
        
        guard let recipe = self.recipe else { return tableViewCell }

//        guard self.recipe != nil else { return tableViewCell }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeDetailTableViewCell", for: indexPath) as! RecipeDetailTableViewCell
        tableView.rowHeight = 250
        cell.updateCell(with: recipe, row: indexPath.row)

        return cell
    }
    

private var recipe: RecipeItem?
    
    func update (with recipe: RecipeItem) {
           self.recipe = recipe
       }

}

