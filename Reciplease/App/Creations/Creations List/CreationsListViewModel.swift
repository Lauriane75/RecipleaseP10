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
    
    func selectCreation(creation: CreationItem)
}

final class CreationsListViewModel {
    
    // MARK: - Properties
    
    private var repository: CreationsListRepositoryType
    
    private var delegate: CreationsListViewModelDelegate?
    
    private var creation: [CreationItem] = [] {
        didSet {
            if creation != [] {
                creationItem?(creation)
            } else {
                delegate?.displayAlert(for: .noCreation)
            }
        }
    }

    private var dataImage: [Data?] = []
    
    // MARK: - Initializer
    
    init(repository: CreationsListRepositoryType, delegate: CreationsListViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }
    
    // MARK: - Output
    
    var titleLabel: ((String) -> Void)?
    var ingredientsAndMethod: ((String) -> Void)?
    var timeLabel: ((String) -> Void)?
    var dietLabel: ((String) -> Void)?
    var yieldLabel: ((String) -> Void)?
    var creationButton: ((String) -> Void)?
    
    var creationItem: (([CreationItem]) -> Void)?

    var imageData: ((Data?) -> Void)?
    
    
    // MARK: - Input
    
    func viewDidLoad() {
        repository.getCreations(callback: { (item) in
            self.creation = item
            self.creationItem?(self.creation)
        })
    }
    
    func didSelectCreation(creation: CreationItem) {
        delegate?.selectCreation(creation: creation)
    }
    
    func didPressDeleteCreation(name: String) {
        repository.didPressRemoveCreation(titleCreation: name)
    }
}
