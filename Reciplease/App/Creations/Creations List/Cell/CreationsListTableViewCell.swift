//
//  CreationsListTableViewCell.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 20/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//
import UIKit

class CreationsListTableViewCell: UITableViewCell {
    
    // MARK: - Outlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var yieldLabel: UILabel!
    @IBOutlet weak var creationImageView: UIImageView!
    
    // MARK: - Properties
    
    private var creation: CreationItem? = nil {
        didSet {
            guard let creation = self.creation else { return }
            guard creation.image != nil else { return }
            creationImageView.image = UIImage(data: creation.image!)
            creationImageView.layer.cornerRadius = 15
            nameLabel.text = creation.name
            timeLabel.text = creation.time
            categoryLabel.text = creation.category
            yieldLabel.text = creation.yield
        }
    }
    
    func updateCell(with creation: CreationItem) {
        self.creation = creation
    }
}
