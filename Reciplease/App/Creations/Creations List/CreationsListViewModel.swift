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
    
    private var repository: CreationRepositoryType
    
    private var delegate: CreationsListViewModelDelegate?
    
    // MARK: - Initializer
    
    init(repository: CreationRepositoryType, delegate: CreationsListViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }
    
    // MARK: - Output
    
    var creationItem: (([CreationItem]) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        repository.getCreations(callback: { (item) in
            guard item != [] else {
                self.delegate?.displayAlert(for: .noCreation)
                return }
            self.creationItem?(item)
        })
    }
    
    func didSelectCreation(creation: CreationItem) {
        delegate?.selectCreation(creation: creation)
    }
    
    func didPressDeleteCreation(name: String) {
        repository.didPressRemoveCreation(titleCreation: name)
    }
}
