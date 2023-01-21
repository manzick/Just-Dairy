//
//  GetYearCount.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 21.01.2023.
//

import Foundation

extension UseCases {
    func getYearCountString() -> String {
        let memories = LocalRxDataManager.shared.getMemories().value
        var yearList: [String] = []
        for memory in memories {
            let yearString = UseCases.shared.getYearFromDate(memory.date)
            yearList.appendIfNotContains(yearString)
        }
        return "\(yearList.count)"
    }
}
