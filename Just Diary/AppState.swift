//
//  AppState.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation

class AppState {
    
    private var memories: [Memory] = []
    
    // MARK: - Public getter func
    
    public func getMemories() -> [Memory] {
        return self.memories
    }
    
    public func addMemories(_ memory: Memory) {
        self.memories.append(memory)
    }
    
    // MARK: - Private main stuff
    private init() {
        let debugData = [
            Memory(date: Date(), title: "Привет", message: "Мир"),
            Memory(date: Date(timeIntervalSince1970: 1668089547), title: "Заголовок", message: "Старая заметка")
        ]
        self.memories = debugData
    }
    static let shared = AppState()
    
}
