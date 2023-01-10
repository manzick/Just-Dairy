//
//  Year.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

struct Year: Identifiable {
    let title: String
    let name: String
    let id: String
    
    public init(title: String = "", name: String) {
        self.title = title
        self.name = name
        self.id = name
    }
}
