//
//  Memory.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation

class Memory {
    
    private let id = UUID()
    public let date: Date
    public var title: String
    public var message: String
    
    init(date: Date, title: String, message: String) {
        self.date = date
        self.title = title
        self.message = message
    }
}
