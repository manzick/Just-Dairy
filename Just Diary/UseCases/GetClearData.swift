//
//  GetClearData.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

extension UseCases {
    public func getClearDayName(byDate date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        return formatter.string(from: date)
    }
}
