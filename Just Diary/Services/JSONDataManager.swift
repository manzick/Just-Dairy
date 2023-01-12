//
//  JSONDataManager.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import Foundation

class JSONDataManager {
    
    func saveldsufhvl() {
        let jsonEncoder = JSONEncoder()
        let memories = LocalRxDataManager.shared.getMemories().value
        if let savedData = try? jsonEncoder.encode(memories) {
            if let jsonString = String(data: savedData, encoding: .utf8){
                // JSON STRING
                print("JSON \(jsonString)")
                let path = FileManager.default.urls(
                    for: .documentDirectory,
                    in: .userDomainMask
                )[0]
                    .appendingPathComponent("myFile")

                if let stringData = jsonString.data(using: .utf8) {
                    try? stringData.write(to: path)
                }
            }
//            let defaults = UserDefaults.standard
//            defaults.set(savedData, forKey: "people")
        } else {
            print("Failed to save people.")
        }
    }
    
    // MARK: - Private main stuff
    private init() {}
    
    static let shared = JSONDataManager()
    
}
