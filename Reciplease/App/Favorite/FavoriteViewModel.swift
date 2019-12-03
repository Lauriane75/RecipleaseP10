//
//  FavoriteViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 13/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol FavoriteViewModelDelegate: class {
    func selectRecipe()
}

final class FavoriteViewModel {
    
    private weak var delegate: FavoriteViewModelDelegate?
    
    // MARK: - Initializer

    init(delegate: FavoriteViewModelDelegate) {
        self.delegate = delegate
    }

}
