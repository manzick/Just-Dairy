//
//  Year.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

struct Year: Identifiable {
    let name: String
    let id: String
    
    public init(name: String = "", id: String) {
        self.name = name
        self.id = id
    }
}
