//
//  DayStruct.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

struct DayStruct: Identifiable {
    
    let title: String
    let message: String
    let date: String
    let id = UUID()
    
//    public init(
//        title: String = R.string.model.noName,
//        year: String,
//        month: String,
//        day: String,
//        message: String
//    ) {
//        self.name = title
//        self.year = year
//        self.month = month
//        self.day = day
//        self.message = message
//
//        self.id = "\(day)/\(month)/\(year)"
//            // TODO: а как же две заметки за один день?!
//    }
    
}
