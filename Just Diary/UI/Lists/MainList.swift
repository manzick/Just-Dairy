//
//  ContentView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 28.12.2022.
//

import SwiftUI

struct MainList: View {
 
    @ObservedObject private var providingDataManager = ProvidingDataManager.shared

    var body: some View {
        NavigationView {
            List(
                providingDataManager.yearsListWithMonth,
                children: \.months
            ) { item in
                if item.months != nil {
                    Text(item.name)
                } else {
                    NavigationLink {
                        DayList(
                            title: "\(item.name) \(item.year)",
                            days: providingDataManager.getDaysList(
                                forMonth: item.name,
                                andYear: item.year
                            )
                        )
                    } label: {
                        Text(item.name)
                    }
                }
            }
            .navigationTitle(R.string.yearList.title)
            .toolbar {
                MainToolbar()
            }
        }
    }
}

struct YearList_Previews: PreviewProvider {
    static var previews: some View {
        MainList()
    }
}
   
