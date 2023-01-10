//
//  GetMonthFromDate.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation

extension UseCases {
    func getMonthFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMMM"
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date).capitalized
    }
}
