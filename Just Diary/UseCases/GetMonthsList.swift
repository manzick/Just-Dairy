//
//  GetMonthsList.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation

extension UseCases {
    func getMonthsList(forYear year: String) -> [YearAndMonthStruct] {
        let memories = AppState.shared.getMemories()
        var monthsString: [String] = []
        for memory in memories {
            if monthsString.count == 11 {
                break
            }
            if UseCases.shared.getYearFromDate(memory.date) != year {
                continue
            }
            monthsString.appendIfNotContains(
                UseCases.shared.getMonthFromDate(memory.date)
            )
        }
        let formatter : DateFormatter = {
            let df = DateFormatter()
//            df.dateFormat = "MMMM"
            df.dateFormat = "LLLL"
            return df
        }()
        let sortedArrayOfMonths = monthsString.sorted( by: {
            formatter.date(from: $0)! < formatter.date(from: $1)!
        })
        var value: [YearAndMonthStruct] = []
        for monthString in sortedArrayOfMonths {
            let month = YearAndMonthStruct(
                name: monthString,
                year: year
            )
            value.append(month)
        }
        return value
    }
}
