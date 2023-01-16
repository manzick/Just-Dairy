//
//  FindTriggeredObj.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 16.01.2023.
//

import Foundation

extension UseCases {
    func findTriggeredObj(in days: [DayStruct]) -> DayStruct {
        for day in days {
            if day.id.uuidString == ProvidingDataManager.shared.clickDayIdString {
                return day
            }
        }
        return DayStruct(title: "", message: "", date: "", id: UUID())
    }
}
