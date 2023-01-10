//
//  MonthList.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import SwiftUI

struct MonthList: View {

    @State public var year: String
    
    init(title: String) {
        self.year = title
    }

    var body: some View {
        List(
            AppState.shared.getMonths(forYear: year)
        ) { month in
            NavigationLink {
                DayList(title: month.name, year: year)
            } label: {
                Text(month.name)
            }
        }
        .navigationTitle(year)
    }
}

struct MonthList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MonthList(title: "2022")
        }
    }
}
