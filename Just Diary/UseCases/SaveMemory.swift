//
//  SaveMemory.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 22.01.2023.
//

import Foundation

extension UseCases {
    func saveMemory(title: String, message: String, date: Date, id: UUID, isEdit: Bool = false) {
        let memory = Memory(date: date, title: title, message: message, id: id)
        if isEdit {
            LocalRxDataManager.shared.updateMemory(memory)
        } else {
            LocalRxDataManager.shared.addMemory(memory)
        }
    }
}
