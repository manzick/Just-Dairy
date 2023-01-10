//
//  Month.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

struct Month: Identifiable {
    let title: String
    let name: String
    let year: String
    let id: String
    
    public init(title: String = "", name: String, year: String) {
        self.title = title
        self.name = name
        self.year = year
        self.id = "\(year)/\(name)"
    }
}
