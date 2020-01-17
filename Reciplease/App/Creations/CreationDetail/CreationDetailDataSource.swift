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

    private var creation: CreationItem?

    // MARK: - Data source

    func update (with creation: CreationItem) {
        self.creation = creation
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let tableViewCell = UITableViewCell()

        guard let creation = self.creation else { return tableViewCell }

        let cell = tableView.dequeueReusableCell(withIdentifier: "creationDetailTableViewCell", for: indexPath) as! CreationDetailTableViewCell
        cell.updateCell(with: creation, row: indexPath.row)

        return cell
    }

}


