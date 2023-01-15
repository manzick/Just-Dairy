//
//  JSONDataManager.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import Foundation

class JSONDataManager {
    
    private var savedMemory: [Memory] = []
    
    //Оптимизация. Проблема в функции activityView, которая дергает getDocument на каждой отрисовке
    //На данном этапе изучения SwiftUI не вижу других способов исправить проблему
    func getDocument(isCalled: Bool = false) -> URL {
        guard isCalled else { return URL(fileURLWithPath: "") }
        let jsonString = self.getJsonString()
        self.saveToAppFolder(jsonString)
        return self.getDocumentPath()
    }
    
    func openDocument(by result: Result<[URL], Error>, completionHandler completion: ((Bool) -> Void)) {
        do {
            guard
                let selectedFile: URL = try result.get().first,
                selectedFile.startAccessingSecurityScopedResource(),
                let fileText = String(data: try Data(contentsOf: selectedFile), encoding: .utf8)
            else {
                completion(false)
                return
            }
            
            let json = Data(fileText.utf8)
            let decoder = JSONDecoder()

            guard let memoriesBox = try? decoder.decode(MemoriesBox.self, from: json) else {
                completion(false)
                selectedFile.stopAccessingSecurityScopedResource()
                return
            }
            
            self.savedMemory = memoriesBox.memories
            completion(true)
            selectedFile.stopAccessingSecurityScopedResource()
        } catch {
            completion(false)
        }
    }
    
    func replaceFromDocument() {
        guard self.savedMemory != [] else { return }
        LocalRxDataManager.shared.replaceMemories(self.savedMemory)
    }
    
    func mergeWithDocument() {
        guard self.savedMemory != [] else { return }
        LocalRxDataManager.shared.mergeMemories(self.savedMemory)
    }
    
    
    // MARK: - Private func for save
    
    private func getJsonString() -> String {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let memories = LocalRxDataManager.shared.getMemories().value
        let memoriesBox = MemoriesBox(with: memories)
        guard let savedData = try? jsonEncoder.encode(memoriesBox) else { return "" }
        guard let jsonString = String(data: savedData, encoding: .utf8) else { return "" }
        return jsonString
    }
    
    private func getFileName() -> String {
        let currentDate = Date()
        let df = DateFormatter()
        df.dateFormat = "y_M_d_HH_mm_ss"
        var value = df.string(from: currentDate)
        value += ".json"
        return value
    }
    
    private func getDocumentPath() -> URL {
        let path = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0]
            .appendingPathComponent(self.getFileName())
        return path
    }
    
    private func saveToAppFolder(_ jsonString: String) {
        let path = self.getDocumentPath()
        if let stringData = jsonString.data(using: .utf8) {
            try? stringData.write(to: path)
        }
    }

    
    // MARK: - Private main stuff
    private init() {}
    
    static let shared = JSONDataManager()
    
}
