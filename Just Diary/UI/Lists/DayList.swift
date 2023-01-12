//
//  DayList.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import SwiftUI

struct DayList: View {
    @State public var title: String
    @State public var days: [DayStruct]
    
    init(title: String, days: [DayStruct]) {
        self.title = title
        self.days = days
    }

    var body: some View {
        List(days) { day in
            NavigationLink {
//                MonthList(title: mob.id)
            } label: {
                DayRow(
                    title: day.title,
                    date: day.date,
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
            DayList(
                title: "January 2023",
                days: [
                    DayStruct(
                        title: "Заголовок",
                        message: "Сообщение",
                        date: "January 15",
                        id: UUID()
                    )
                ]
            )
        }
    }
}

