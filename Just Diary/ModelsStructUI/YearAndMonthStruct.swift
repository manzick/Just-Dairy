//
//  YearAndMonthStruct.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

struct YearAndMonthStruct: Identifiable, Equatable {
    var months: [YearAndMonthStruct]? = nil
    var year: String = ""
    let name: String
    let id = UUID()
    
    public init(name: String, months: [YearAndMonthStruct]? = nil, year: String = "") {
        self.name = name
        self.months = months
        self.year = year
    }
    
    static func ==(left:YearAndMonthStruct, right:YearAndMonthStruct) -> Bool {
        let value1 = left.name == right.name
        let value2 = left.months == right.months
        return value1 == value2
    }
}
