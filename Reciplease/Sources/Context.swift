//
//  Context.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 27/01/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

/// Responsible to inject dependencies
final class Context {
    
    public let stack: CoreDataStack
    
    init(stack: CoreDataStack) {
        self.stack = stack
    }
}
