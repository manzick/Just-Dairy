//
//  DatabaseDataManager.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import Foundation
import CoreData

class DatabaseDataManager {
    
    private let container = NSPersistentContainer(name: "MainData")
    private var managedContext: NSManagedObjectContext?
    
    func getData() -> [Memory] {
        guard let managedContext = self.managedContext else { return [] }
        let memoryFetch = MemoryObject.fetchRequest()
        let sortByDate = NSSortDescriptor(key: #keyPath(MemoryObject.date), ascending: false)
        memoryFetch.sortDescriptors = [sortByDate]
        do {
            let result = try managedContext.fetch(memoryFetch)
            var value: [Memory] = []
            for res in result {
                let temp = Memory(fromMemoreObject: res)
                value.append(temp)
            }
            return value
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
            return []
        }
    }
    
    func saveData(memory: Memory) {
        guard let managedContext = self.managedContext else { return }
        let memoryObject = MemoryObject(context: managedContext)
        memoryObject.title = memory.title
        memoryObject.message = memory.message
        memoryObject.date = memory.date
        memoryObject.id = memory.id
        self.saveContext()
    }
    
    // MARK: - Private func
    
    private func saveContext() {
        guard let managedContext = self.managedContext else { return }
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    
    // MARK: - Private main stuff
    private init() {
        self.container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        self.managedContext = self.container.viewContext
    }
    
    static let shared = DatabaseDataManager()
    
}
