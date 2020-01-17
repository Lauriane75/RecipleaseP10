//
//  CreationDetailViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 17/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol CreationDetailViewModelDelegate: class {
    func displayAlert(for type: AlertType)
    func didPressCreationListButton()
}


final class CreationDetailViewModel {

    private var repository: CreationRecipeRepositoryType

    private var delegate: CreationDetailViewModelDelegate?

    // MARK: - Initializer

    init(repository: CreationRecipeRepositoryType, delegate: CreationDetailViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Output

    var image: ((String) -> Void)?

    var title: ((String) -> Void)?
    var ingredients: ((String) -> Void)?
    var method: ((String) -> Void)?

    var timeLabel: ((String) -> Void)?
    var dietLabel: ((String) -> Void)?
    var yieldLabel: ((String) -> Void)?
    var showCreationsListButton: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {

    }

    func didPressShowCreationsListButton() {
//        delegate?.didPressCreationListButton()
    }

}
