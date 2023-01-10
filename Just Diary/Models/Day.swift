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
    let year: String
    let month: String
    let day: String
    let message: String
    
    public init(
        title: String = R.string.model.noName,
        year: String,
        month: String,
        day: String,
        message: String
    ) {
        self.name = title
        self.year = year
        self.month = month
        self.day = day
        self.message = message
        
        self.id = "\(day)/\(month)/\(year)"
            // TODO: а как же две заметки за один день?!
    }
    
}
