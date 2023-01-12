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
    
    public func addMemory(_ memory: Memory) {
        var tempMemories = self.memories.value
        tempMemories.append(memory)
        self.memories.accept(tempMemories)
        DatabaseDataManager.shared.saveToDB(memory: memory)
    }
    
    public func addMemory(title: String, message: String, date: Date) {
        let memory = Memory(date: date, title: title, message: message)
        self.addMemory(memory)
    }

    
    // MARK: - Private main stuff
    private init() {
        let debugData = [
            Memory(date: Date(timeIntervalSince1970: 1636717136), title: "Привет", message: "Мир"),
            Memory(date: Date(timeIntervalSince1970: 1668089547), title: "Заголовок", message: "Старая заметка")
        ]
        self.memories.accept(debugData)
        
        self.memories.accept(DatabaseDataManager.shared.getFromDB())
    }
    
    static let shared = LocalRxDataManager()
    
}