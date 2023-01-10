//
//  AppState.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 10.01.2023.
//

import Foundation

class AppState {
    
    private var years: [Year] = []
    private var months: [Month] = []
    private var days: [Day] = []
    
    // MARK: - Public getter func
    
    public func getYears() -> [Year] {
        return self.years
    }
    
    public func getMonths(forYear year: String? = nil) -> [Month] {
        if let year = year {
            return self.months.filter { month in
                return month.year == year
            }
        } else {
            return self.months
        }
    }
    
    public func getDays(forYear year: String? = nil, andMonth month: String? = nil) -> [Day] {
        if let year = year, let month = month {
            return self.days.filter { day in
                return day.year == year && day.month == month
            }
        } else {
            return self.days
        }
    }
    
    // MARK: - Private main stuff
    private init() {
        let debugDataYears = [
            Year(name: "2020"),
            Year(name: "2021"),
            Year(name: "2022"),
            Year(name: "2023")
        ]
        self.years = debugDataYears
        
        let debugDataMonth = [
            Month(name: "1", year: "2022"),
            Month(name: "2", year: "2022"),
            Month(name: "3", year: "2022"),
            Month(name: "1", year: "2023")
        ]
        self.months = debugDataMonth
        
        let debugDataDay = [
            Day(title: "Мудрость из неизвестного источника", year: "2022", month: "1", day: "24", message: "Привет"),
            Day(title: "Hello world 2", year: "2022", month: "2", day: "16", message: "Привет 2"),
            Day(title: "Еще важный текст", year: "2023", month: "1", day: "1", message: "Привет мир")
        ]
        self.days = debugDataDay
    }
    static let shared = AppState()
    
}
