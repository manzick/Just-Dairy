//
//  DayListViewModel.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 22.01.2023.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftUI

extension DayList {
    @MainActor class ViewModel: ObservableObject {
        @Published var daysList: [DayStruct] = []
        
        @Published var month: String
        @Published var year: String
        
        func createDaysList() {
            LocalRxDataManager
                .shared
                .getMemories()
                .subscribe { [weak self] memories in
                    guard let self else { return }
                    let currentMemories = memories.filter { memory in
                        return UseCases.shared.getMonthFromDate(memory.date) == self.month && UseCases.shared.getYearFromDate(memory.date) == self.year
                    }
                    var value: [DayStruct] = []
                    for memory in currentMemories {
                        let day = DayStruct(
                            title: memory.title,
                            message: memory.message,
                            date: UseCases.shared.getClearDayName(byDate: memory.date),
                            id: memory.id
                        )
                        value.append(day)
                    }
                    self.daysList = value
//                    self.daysList = [DayStruct(title: "Ghbdtn", message: "MANZICK", date: "kusgdf", id: UUID())]
                }
                .disposed(by: self.disposeBag)
        }
        
        init(month: String, year: String) {
            self.month = month
            self.year = year
            self.createDaysList()
        }
        
        private let disposeBag = DisposeBag()
    }
}
