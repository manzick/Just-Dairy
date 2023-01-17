//
//  MemoryObject+Extension.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 16.01.2023.
//

import Foundation
import CoreData

extension MemoryObject {
    convenience init(byMemory memory: Memory, andContext context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = memory.id
        self.title = memory.title
        self.message = memory.message
        self.date = memory.date
        self.isFavorite = memory.isFavorite
    }
}
