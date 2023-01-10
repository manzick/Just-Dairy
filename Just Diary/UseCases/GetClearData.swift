//
//  GetClearData.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

extension UseCases {
    public static func getClearData(day: Int, month: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        if let date = formatter.date(from: "\(month)/\(day)") {
            formatter.dateFormat = "dd MMMM"
            return formatter.string(from: date)
        } else {
            return "\(day)/\(month)"
        }
    }
}
