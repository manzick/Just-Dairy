//
//  MonthList.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import SwiftUI

struct MonthList: View {
    @State private var months = [
        Month(id: "Январь"),
        Month(id: "Февраль"),
        Month(id: "Март")
    ]
    @State public var title: String
    
    init(title: String) {
        self.title = title
    }

    var body: some View {
        List(months) { month in
            NavigationLink {
                DayList(title: month.id)
            } label: {
                Text(month.id)
            }
        }
        .navigationTitle(title)
    }
}

struct MonthList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MonthList(title: "Name of the year")
        }
    }
}
