//
//  Day.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

struct Day: Identifiable {
    
    let id: String
    let name: String
    let year: Int
    let month: Int
    let day: Int
    let message: String
    
    public init(
        name: String = "Без имени",
        year: Int,
        month: Int,
        day: Int,
        message: String
    ) {
        self.name = name
        self.year = year
        self.month = month
        self.day = day
        self.message = message
        
        self.id = "\(day)/\(month)/\(year)"
            // TODO: а как же две заметки за один день?!
    }
    
}
