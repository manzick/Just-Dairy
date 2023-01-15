//
//  Memory.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation

// TODO: NSObject больше не предок этого класса, подумать а не стало ли хуже?

class Memory: Codable, Hashable, Equatable {
    
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.message = try container.decode(String.self, forKey: .message)
        self.date = try container.decode(Date.self, forKey: .date)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case message
        case date
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
    
    static func ==(left:Memory, right:Memory) -> Bool {
        return left.id == right.id
    }
}

class MemoriesBox: Codable {
    let memories: [Memory]
    init(with memories: [Memory]) {
        self.memories = memories
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.memories = try container.decode([Memory].self, forKey: .memories)
    }
    
    enum CodingKeys: String, CodingKey {
        case memories
    }
}
