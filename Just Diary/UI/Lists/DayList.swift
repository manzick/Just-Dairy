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
    
    @State var showSheetView: Bool = false
    @State var clickIdString: String?
    
//    @State var showMemorySV = false
    
    init(title: String, days: [DayStruct]) {
        self.title = title
        self.days = days
    }

    var body: some View {
        List(days) { day in
//            NavigationLink {
////                MonthList(title: mob.id)
//            } label: {
//                DayRow(
//                    title: day.title,
//                    date: day.date,
//                    message: day.message
//                )
//            }
            Button(action: {
                self.showSheetView.toggle()
                ProvidingDataManager.shared.clickDayIdString = day.id.uuidString
                print()
            }) {
                DayRow(
                    title: day.title,
                    date: day.date,
                    message: day.message
                )
            }
            .foregroundColor(.black)
            
        }
        .sheet(isPresented: $showSheetView) {
            let day = UseCases.shared.findTriggeredObj(in: self.days)
            MemoryView(dayStruct: day)
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

