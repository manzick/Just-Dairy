//
//  Month.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

struct Month: Identifiable {
    let name: String
    let id: String
    
    public init(name: String = "", id: String) {
        self.name = name
        self.id = id
    }
}
