//
//  DayModel.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 30.01.2023.
//

import Foundation

class DayModel: ObservableObject, Identifiable {
    
    @Published var title: String
    @Published var message: String
    @Published var date: String
    let id: UUID
    
    init(title: String, message: String, date: String, id: UUID) {
        self.title = title
        self.message = message
        self.date = date
        self.id = id
    }
}
