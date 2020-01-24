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
    
    private var imageSaved: [Data?] = []
    
    private var creation: CreationItem? = nil {

        didSet {
            guard let creation = self.creation else { return }
            creationImageView.layer.cornerRadius = 15
//            creationImageView.image =
            nameLabel.text = creation.name
            timeLabel.text = creation.time
            categoryLabel.text = creation.category
            yieldLabel.text = creation.yield
        }
    }
    
    func updateCell(with creation: CreationItem, imageData: [Data?]) {
        self.creation = creation
        self.imageSaved = imageData
        print("updateCell image = \(imageSaved)")
    }
}
