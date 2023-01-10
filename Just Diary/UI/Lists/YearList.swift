//
//  ContentView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 28.12.2022.
//

import SwiftUI

struct YearList: View {
 
    @State var showNewMemoryModal = false

    var body: some View {
        NavigationView {
            List(
                UseCases.shared.getYearsListWithMonth(),
                children: \.months
            ) { item in
                if item.months != nil {
                    Text(item.name)
                } else {
                    NavigationLink {
                        DayList(
                            title: "\(item.name) \(item.year)",
                            days: UseCases.shared.getDaysList(
                                forMonth: item.name,
                                andYear: item.year
                            )
                        )
                        Text("")
                    } label: {
                        Text(item.name)
                    }
                }
            }
            .navigationTitle(R.string.yearList.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gear").imageScale(.large)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showNewMemoryModal = true
                    }) {
                        Image(systemName: "square.and.pencil").imageScale(.large)
                    }.fullScreenCover(isPresented: $showNewMemoryModal) {
                        NewMemoryView()
                    }
                }
            }
        }
    }
}

struct YearList_Previews: PreviewProvider {
    static var previews: some View {
        YearList()
    }
}
   
