//
//  FindTriggeredObj.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 16.01.2023.
//

import Foundation

extension UseCases {
    func findTriggeredObj(byId idString: String?, in days: [DayModel]) -> DayModel {
        guard let idString else { return DayModel(title: "", message: "", date: "", id: UUID()) }
        for day in days {
            if day.id.uuidString == idString {
                return day
            }
        }
        return DayModel(title: "", message: "", date: "", id: UUID())
    }
}
