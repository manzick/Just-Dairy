//
//  MemoryView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 16.01.2023.
//

import SwiftUI

struct MemoryView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let dayStruct: DayStruct

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack{
                        Text(dayStruct.title)
                            .font(.system(size: 36, weight: .semibold))
                            .padding(.leading, 20)
                        Spacer()
                    }
                    HStack{
                        Text(dayStruct.message)
                            .padding(.leading, 20)
                            .padding(.top, 5)
                        Spacer()
                    }
                    Spacer()
                }
            }
                .navigationTitle(dayStruct.date)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    MemoryViewToolbar(
                        close: {
                            self.dismiss()
                        },
                        delete: {
                            LocalRxDataManager.shared.removeMemory(
                                byId: dayStruct.id
                            )
                        },
                        edit: {
                            
                        }
                    )
                }
        }
    }
}

struct MemoryView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView(
            dayStruct:
                DayStruct(
                    title: "Title",
                    message: "Just message",
                    date: "January 15",
                    id: UUID()
                )
        )
    }
}

