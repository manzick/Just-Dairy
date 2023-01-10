//
//  GetDaysList.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation

extension UseCases {
    func getDaysList(forMonth month: String, andYear year: String) -> [DayStruct] {
        let memories = AppState.shared.getMemories()
        let currentMemories = memories.filter { memory in
            return UseCases.shared.getMonthFromDate(memory.date) == month && UseCases.shared.getYearFromDate(memory.date) == year
        }
        
        var value: [DayStruct] = []
        for memory in currentMemories {
            let day = DayStruct(
                title: memory.title,
                message: memory.message,
                date: UseCases.shared.getClearDayName(byDate: memory.date)
            )
            value.append(day)
        }
        return value
    }
}
