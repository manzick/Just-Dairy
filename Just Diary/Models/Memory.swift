//
//  Memory.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation

class Memory: Codable, Hashable, Equatable {
    
    public var title: String
    public var message: String
    public let id: UUID
    public let date: Date
    public var isFavorite: Bool
    public var tags: [String]
    
    init(date: Date, title: String, message: String, id: UUID = UUID(), isFavorite: Bool = false, tags: [String] = []) {
        self.title = title
        self.message = message
        self.id = id
        self.date = date
        self.isFavorite = isFavorite
        self.tags = tags
    }
    
    init(fromMemoreObject memoryObject: MemoryObject) {
        self.title = memoryObject.title ?? ""
        title = title != "" ? title : R.string.model.noName
        self.message = memoryObject.message ?? ""
        self.id = memoryObject.id ?? UUID()
        self.date = memoryObject.date ?? Date()
        self.isFavorite = memoryObject.isFavorite
        self.tags = memoryObject.tags ?? []
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? container.decode(UUID.self, forKey: .id)) ?? UUID()
        self.title = (try? container.decode(String.self, forKey: .title)) ?? R.string.model.noName
        self.message = (try? container.decode(String.self, forKey: .message)) ?? ""
        self.date = (try? container.decode(Date.self, forKey: .date)) ?? Date()
        self.isFavorite = (try? container.decode(Bool.self, forKey: .isFavorite)) ?? false
        self.tags = (try? container.decode([String].self, forKey: .tags)) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case message
        case date
        case isFavorite
        case tags
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
    
    static func ==(left:Memory, right:Memory) -> Bool {
        return left.id == right.id
    }
}
