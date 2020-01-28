////
////  CreationRecipeRepository.swift
////  Reciplease
////
////  Created by Lauriane Haydari on 16/01/2020.
////  Copyright © 2020 Lauriane Haydari. All rights reserved.
////
import CoreData

protocol CreationRepositoryType {
    func didPressSaveCreation(creation: CreationItem)
    func didPressRemoveCreation(titleCreation: String)
    func getCreations(callback: @escaping ([CreationItem]) -> Void)
}

final class CreationRepository: CreationRepositoryType {

    // MARK: - Properties

    private let stack: CoreDataStack

    // MARK: - Initializer

    init(stack: CoreDataStack) {
        self.stack = stack
    }

    // MARK: - Save

    func didPressSaveCreation(creation: CreationItem) {

        let creationObject = CreationObject(context: stack.context)
        creationObject.imageCreation = creation.image
        creationObject.titleCreation = creation.name
        creationObject.ingredientCreation = creation.ingredient
        creationObject.methodCreation = creation.method
        creationObject.timeCreation = creation.time
        creationObject.categoryCreation = creation.category
        creationObject.yieldCreation = creation.yield

        stack.saveContext()
    }

    // MARK: - Remove

    func didPressRemoveCreation(titleCreation: String) {
        let request: NSFetchRequest<CreationObject> = CreationObject.fetchRequest()
        request.predicate = NSPredicate(format: "titleCreation == %@", titleCreation)

        if let object = try? stack.context.fetch(request), let firstObject = object.first {
            stack.context.delete(firstObject)
            stack.saveContext()
        }
    }

    // MARK: - get

    func getCreations(callback: @escaping ([CreationItem]) -> Void) {
        let requestCreation: NSFetchRequest<CreationObject> = CreationObject.fetchRequest()
        guard let creations = try? stack.context.fetch(requestCreation) else { return }
        let creation: [CreationItem] = creations.map { return CreationItem(object: $0) }
        callback(creation)
    }
}

extension CreationItem {
    init(object: CreationObject) {
        self.image = object.imageCreation
        self.name = object.titleCreation ?? ""
        self.ingredient = object.ingredientCreation ?? ""
        self.method = object.methodCreation ?? ""
        self.time = object.timeCreation ?? ""
        self.category = object.categoryCreation ?? ""
        self.yield = object.yieldCreation ?? ""
    }
}
