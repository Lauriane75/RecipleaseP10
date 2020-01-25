//
//  CreationViewModel.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 12/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol CreationDetailViewModelDelegate: class {
    func showCreationsListView()
    func selectCreation(creation: CreationItem)
}

final class CreationDetailViewModel {
    
    private var repository: SavingCreationRepositoryType
    
    private var delegate: CreationDetailViewModelDelegate?
    
    private var creation: CreationItem
    
    // MARK: - Initializer
    
    init(repository: SavingCreationRepositoryType, delegate: CreationDetailViewModelDelegate?, creation: CreationItem) {
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

    var imageData: ((Data?) -> Void)?
    
    var creationButton: ((String) -> Void)?
    
    var creationDisplayed: (([CreationItem]) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        self.titleLabel?(creation.name)
        self.ingredientsAndMethod?("\(creation.ingredient)\n\(creation.method)")
        self.timeLabel?(creation.time)
        self.dietLabel?(creation.category)
        self.yieldLabel?(creation.yield)
        self.creationButton?("My creations")
        self.creationDisplayed?([creation])
        self.imageData?(creation.image)
    }
    
    func didPressMyCreationsButton() {
        self.delegate?.showCreationsListView()
    }
    
    func didPressDeleteCreationButton() {
        repository.didPressRemoveCreation(titleCreation: creation.name)
        delegate?.showCreationsListView()
    }
}
