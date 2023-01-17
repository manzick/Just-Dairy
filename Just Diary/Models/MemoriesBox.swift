//
//  MemoriesBox.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 16.01.2023.
//

import Foundation

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
