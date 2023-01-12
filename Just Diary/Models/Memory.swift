//
//  Memory.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation

class Memory: NSObject, Codable {
    
    public var title: String
    public var message: String
    public let id: UUID
    public let date: Date
    
    init(date: Date, title: String, message: String) {
        self.title = title
        self.message = message
        self.id = UUID()
        self.date = date
    }
    
    init(fromMemoreObject memoryObject: MemoryObject) {
        self.title = memoryObject.title ?? R.string.model.noName
        self.message = memoryObject.message ?? ""
        self.id = memoryObject.id ?? UUID()
        self.date = memoryObject.date ?? Date()
    }
}
