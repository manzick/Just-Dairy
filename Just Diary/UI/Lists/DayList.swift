//
//  DayList.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import SwiftUI

struct DayList: View {
    @State public var title: String
    
    @State var showSheetView: Bool = false
    @State var clickIdString: String?
    
    @StateObject public var viewModel: ViewModel
    
    init(month: String, year: String) {
        self.title = "\(month) \(year)"
        _viewModel = StateObject(
            wrappedValue: ViewModel(
                month: month,
                year: year
            ))
    }

    var body: some View {
        List(viewModel.daysList) { day in
            Button(action: {
                self.showSheetView.toggle()
                ProvidingDataManager.shared.clickDayIdString = day.id.uuidString
            }) {
                DayRow(
                    title: day.title,
                    date: day.date,
                    message: day.message
                )
            }
            .swipeActions {
                Button(action: {
                    LocalRxDataManager.shared.removeMemory(
                        byId: day.id
                    )
                }) {
                    Image(systemName: "trash").imageScale(.large)
                }
                .tint(.red)
                
                Button(action: {
                    LocalRxDataManager.shared.setMemoryFavorite(byId: day.id)
                }) {
                    Image(systemName: "star.fill").imageScale(.large)
                }
                .tint(.blue)
            }
            
        }
        .sheet(isPresented: $showSheetView) {
            let day = UseCases.shared.findTriggeredObj(in: viewModel.daysList)
            MemoryView(dayStruct: day)
        }
        .navigationTitle(title)
    }
}

struct DayList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DayList(
                month: "January",
                year: "2023"
            )
        }
    }
}

