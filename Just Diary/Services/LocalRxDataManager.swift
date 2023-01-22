//
//  DataManager.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation
import RxSwift
import RxRelay

class LocalRxDataManager {
    
    private var memories: BehaviorRelay<[Memory]> = BehaviorRelay(value: [])
    
    // MARK: - Public getter func
    
    public func getMemories() -> BehaviorRelay<[Memory]> {
        return self.memories
    }
    
    public func getMemory(byId id: UUID) -> Memory? {
        let memories = self.memories.value
        let memory = memories.first(where: {$0.id == id})
        return memory
    }
    
    public func setMemoryFavorite(_ value: Bool = true, byId id: UUID) {
        guard let memory = self.getMemory(byId: id) else { return }
        memory.isFavorite = value
        self.removeMemory(byId: id)
        self.addMemory(memory)
    }
    
    public func addMemory(_ memory: Memory) {
        var tempMemories = self.memories.value
        tempMemories.append(memory)
        self.memories.accept(tempMemories)
        DatabaseDataManager.shared.saveData(memory: memory)
    }
    
    public func updateMemory(_ memory: Memory) {
        self.removeMemory(byId: memory.id)
        self.addMemory(memory)
    }
    
    public func removeMemory(byId id: UUID) {
        var tempMemories = self.memories.value
        tempMemories.removeAll(where: {$0.id == id})
        self.memories.accept(tempMemories)
        DatabaseDataManager.shared.deleteMemory(byId: id)
    }
    
    public func replaceMemories(_  memories: [Memory]) {
        for memory in self.memories.value {
            self.removeMemory(byId: memory.id)
        }
        for memory in memories {
            self.addMemory(memory)
        }
    }
    
    public func mergeMemories(_  memories: [Memory]) {
        for memory in memories {
            self.addMemory(memory)
        }
    }

    
    // MARK: - Private main stuff
    private init() {
        let debugData = [
            Memory(date: Date(timeIntervalSince1970: 1636717136), title: "Привет", message: "Мир"),
            Memory(date: Date(timeIntervalSince1970: 1668089547), title: "Заголовок", message: "Старая заметка")
        ]
        self.memories.accept(debugData)
        
        self.memories.accept(DatabaseDataManager.shared.getData())
    }
    
    static let shared = LocalRxDataManager()
    
}
