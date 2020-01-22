//
//  CreationsListViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 21/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol CreationsListViewModelDelegate: class {
    func displayAlert(for type: AlertType)

    func didPressCreationsListItem(creation: CreationItem)

    func openListFromItem(creations: [CreationItem])

    func selectCreation(creation: CreationItem)
}

final class CreationsListViewModel {

    private var repository: CreationRecipeRepositoryType

    private var creation: CreationItem

    private var delegate: CreationsListViewModelDelegate?

    // MARK: - Initializer

    init(repository: CreationRecipeRepositoryType, delegate: CreationsListViewModelDelegate?, creation: CreationItem) {
        self.repository = repository
        self.delegate = delegate
        self.creation = creation
    }

    // MARK: - Properties

    private var visibleCreation: [CreationItem] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.creationDisplayed?(self.visibleCreation)
            }
        }
    }

    // MARK: - Output

    var titleLabel: ((String) -> Void)?
    var ingredientsAndMethod: ((String) -> Void)?

    var timeLabel: ((String) -> Void)?
    var dietLabel: ((String) -> Void)?
    var yieldLabel: ((String) -> Void)?

    var creationButton: ((String) -> Void)?

    var creationDisplayed: (([CreationItem]) -> Void)?

    var creationItem: ((CreationItem) -> Void)?


    // MARK: - Input

    func viewDidLoad() {

        repository.didPressSaveButton(creation: creation)
        self.creationDisplayed?([creation])
    }

    func updateCreations(creation: CreationItem) {
        delegate?.didPressCreationsListItem(creation: creation)
    }


    func didSelectCreationRecipe(creation: CreationItem) {
        delegate?.selectCreation(creation: creation)
    }
}

