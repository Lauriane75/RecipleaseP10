//
//  Extension.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 17/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func download(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data, let image = UIImage(data: imageData) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
