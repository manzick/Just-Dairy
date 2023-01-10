//
//  GetYearsList.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation

extension UseCases {
    func getYearsListWithMonth() -> [YearAndMonthStruct] {
        let memories = AppState.shared.getMemories()
        var yearsString: [String] = []
        for memory in memories {
            yearsString.appendIfNotContains(
                UseCases.shared.getYearFromDate(memory.date)
            )
        }
        yearsString.sort()
        var value: [YearAndMonthStruct] = []
        for yearString in yearsString {
            let year = YearAndMonthStruct(
                name: yearString,
                months: UseCases.shared.getMonthsList(forYear: yearString)
            )
            value.append(year)
        }
        return value
    }
}
