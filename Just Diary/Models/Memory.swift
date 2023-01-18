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
    public let isFavorite: Bool
    
    init(date: Date, title: String, message: String, isFavorite: Bool = false) {
        self.title = title
        self.message = message
        self.id = UUID()
        self.date = date
        self.isFavorite = isFavorite
    }
    
    init(fromMemoreObject memoryObject: MemoryObject) {
        self.title = memoryObject.title ?? ""
        title = title != "" ? title : R.string.model.noName
        self.message = memoryObject.message ?? ""
        self.id = memoryObject.id ?? UUID()
        self.date = memoryObject.date ?? Date()
        self.isFavorite = memoryObject.isFavorite
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? container.decode(UUID.self, forKey: .id)) ?? UUID()
        self.title = (try? container.decode(String.self, forKey: .title)) ?? R.string.model.noName
        self.message = (try? container.decode(String.self, forKey: .message)) ?? ""
        self.date = (try? container.decode(Date.self, forKey: .date)) ?? Date()
        self.isFavorite = (try? container.decode(Bool.self, forKey: .isFavorite)) ?? false
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case message
        case date
        case isFavorite
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
    
    static func ==(left:Memory, right:Memory) -> Bool {
        return left.id == right.id
    }
}
