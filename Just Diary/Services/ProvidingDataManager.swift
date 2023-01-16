//
//  ProvidingDataManager.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import Foundation
import RxSwift
import RxCocoa

class ProvidingDataManager: ObservableObject {
    
    @Published var yearsListWithMonth: [YearAndMonthStruct] = []
    var clickDayIdString: String?
    

    func getDaysList(forMonth month: String, andYear year: String) -> [DayStruct] {
        let memories = LocalRxDataManager.shared.getMemories().value
        let currentMemories = memories.filter { memory in
            return UseCases.shared.getMonthFromDate(memory.date) == month && UseCases.shared.getYearFromDate(memory.date) == year
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
        return value
    }
    
    
    // MARK: - Private func
    private func createMainList() {
        LocalRxDataManager
            .shared
            .getMemories()
            .subscribe { [weak self] memories in
                guard let self else { return }
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
                        months: self.getMonthsList(forYear: yearString)
                    )
                    value.append(year)
                }
                self.yearsListWithMonth = value
            }
            .disposed(by: self.disposeBag)
    }
    
    private func getMonthsList(forYear year: String) -> [YearAndMonthStruct] {
        let memories = LocalRxDataManager.shared.getMemories().value
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
    
    
    // MARK: - Private main stuff
    private init() {
        self.createMainList()
    }
    static let shared = ProvidingDataManager()
    private let disposeBag = DisposeBag()
}
