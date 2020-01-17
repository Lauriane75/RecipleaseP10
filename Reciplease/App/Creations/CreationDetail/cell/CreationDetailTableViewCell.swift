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

    private var creation: CreationItem?

    private var row: Int?


    // MARK: - Private properties

    func updateCell(with creation: CreationItem, row: Int) {
        self.creation = creation
        self.row = row
        ingredientLabel.text = "\(creation.ingredient)"

    }

}

