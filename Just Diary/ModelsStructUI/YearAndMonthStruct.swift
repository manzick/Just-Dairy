//
//  YearAndMonthStruct.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

struct YearAndMonthStruct: Identifiable {
    var months: [YearAndMonthStruct]? = nil
    var year: String = ""
    let name: String
    let id = UUID()
    
    public init(name: String, months: [YearAndMonthStruct]? = nil, year: String = "") {
        self.name = name
        self.months = months
        self.year = year
    }
}
