//
//  CreationsListDataSource.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 20/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class CreationsListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var creations: [CreationItem] = []
    var selectedCreation: ((CreationItem) -> Void)?

    func update (updatedCreations: [CreationItem]) {
        self.creations = updatedCreations
    }
    
    // MARK: - DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard indexPath.item < creations.count else {
            fatalError("Error! No service connection")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreationsListTableViewCell", for: indexPath) as! CreationsListTableViewCell
        cell.updateCell(with: creations[indexPath.row])
        return cell
    }
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < creations.count else { return }
        selectedCreation?(creations[indexPath.row])
        print("select")
    }
}
