//
//  DayList.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import SwiftUI

struct DayList: View {
    @State private var days = [
        Day(name: "Мудрость из неизвестного источника", year: 2022, month: 02, day: 15, message: "Привет"),
        Day(name: "Hello world 2", year: 2022, month: 02, day: 16, message: "Привет 2")
    ]
    @State public var title: String
    
    init(title: String) {
        self.title = title
    }

    var body: some View {
        List(days) { day in
            NavigationLink {
//                MonthList(title: mob.id)
            } label: {
                DayRow(
                    title: day.name,
                    date: UseCases.getClearData(
                        day: day.day,
                        month: day.month
                    ),
                    message: day.message
                )
            }
        }
        .navigationTitle(title)
    }
}

struct DayList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DayList(title: "Name of the month")
        }
    }
}

