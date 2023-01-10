//
//  ContentView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 28.12.2022.
//

import SwiftUI

struct YearList: View {
    @State private var years = [
        Year(id: "2021"),
        Year(id: "2022"),
        Year(id: "2023")
    ]
    @State var showNewMemoryModal = false

    var body: some View {
        NavigationView {
            List(years) { year in
                NavigationLink {
                    MonthList(title: year.id)
                } label: {
                    Text(year.id)
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
   
