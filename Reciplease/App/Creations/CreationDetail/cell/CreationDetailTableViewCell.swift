//
//  CreationDetailTableViewCell.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 17/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class CreationDetailTableViewCell: UITableViewCell {
    
    // MARK: - Outlet
    
    @IBOutlet weak var ingredientLabel: UILabel!
    
    private var ingredientAndMethod: String?
    
    private var row: Int?
    
    // MARK: - Private properties
    
    func updateCell(with ingredientAndMethod: String, row: Int) {
        self.ingredientAndMethod = ingredientAndMethod
        self.row = row
        ingredientLabel.text = ingredientAndMethod
    }
}
