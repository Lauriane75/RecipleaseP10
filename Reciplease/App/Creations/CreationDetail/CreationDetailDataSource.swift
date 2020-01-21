//
//  CreationDetailDataSource.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 17/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class CreationDetailDataSource: NSObject, UITableViewDataSource {

    // MARK: - Properties

    private var ingredientAndMethod: String?

    // MARK: - Data source

    func update (with ingredientAndMethod: String?) {
        self.ingredientAndMethod = ingredientAndMethod
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let tableViewCell = UITableViewCell()

        guard let ingredientAndMethod = self.ingredientAndMethod else { return tableViewCell }

        let cell = tableView.dequeueReusableCell(withIdentifier: "creationDetailTableViewCell", for: indexPath) as! CreationDetailTableViewCell
        cell.updateCell(with: ingredientAndMethod, row: indexPath.row)

        return cell
    }

}


