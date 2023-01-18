//
//  DatabaseDataManager.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import Foundation
import CoreData

class DatabaseDataManager {
    
    private var memoriesObjects: [MemoryObject] = []
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
            for memoryObject in result {
                let temp = Memory(fromMemoreObject: memoryObject)
                value.append(temp)
                self.memoriesObjects.append(memoryObject)
            }
            return value
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
            return []
        }
    }
    
    func saveData(memory: Memory) {
        guard let managedContext = self.managedContext else { return }
        let memoryObject = MemoryObject(byMemory: memory, andContext: managedContext)
        self.memoriesObjects.append(memoryObject)
        self.saveContext()
    }
    
    func deleteMemory(byId id: UUID) {
        guard let managedContext = self.managedContext else { return }
        guard let memoryObject = self.memoriesObjects.first(where: {$0.id == id}) else { return }
        managedContext.delete(memoryObject)
        self.saveContext(managedContext)
    }
    
    func update(memory: Memory) {
//        guard let managedContext = self.managedContext else { return }
//        let memoryObject = MemoryObject(byMemory: memory, andContext: managedContext)
//        managedContext.fet
//        self.saveContext()
    }
    
    // MARK: - Private func
    
    private func saveContext(_ context: NSManagedObjectContext? = nil) {
        guard let managedContext = context ?? self.managedContext else { return }
//        guard let managedContext = self.managedContext else { return }
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
            print("contex saved")
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
