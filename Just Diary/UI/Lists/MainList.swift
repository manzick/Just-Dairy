//
//  ContentView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 28.12.2022.
//

import SwiftUI

struct MainList: View {
    
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List(
                viewModel.yearsListWithMonth,
                children: \.months
            ) { item in
                if item.months != nil {
                    Text(item.name)
                } else {
                    NavigationLink {
                        DayList(
                            month: item.name,
                            year: item.year
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
   
