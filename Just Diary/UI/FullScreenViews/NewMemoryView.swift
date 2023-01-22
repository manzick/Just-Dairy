//
//  NewMemoryView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 07.01.2023.
//

import SwiftUI

struct NewMemoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var title = ""
    @State var message = ""
    @State var datePickerDate = Date.now
    
    @State var isEdit = false

    var body: some View {
        NavigationView {
            List {
                Section{
                    TextField(
                        R.string.newMemory.titlePlaceHolder,
                        text: $title
                    )
                    DatePicker(
                        selection: $datePickerDate,
                        in: ...Date.now,
                        displayedComponents: .date) {
                            Text(R.string.newMemory.datePlaceHolder)
                        }
                }
                Section {
                    TextEditor(
                        text: $message
                    )
                    .frame(minHeight: 250)
                }
            }
            .navigationTitle(R.string.newMemory.title)
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                NewMemoryToolbar(
                    close: {
                        self.presentationMode.wrappedValue.dismiss()
                    },
                    save: {
                        UseCases.shared.saveMemory(
                            title: self.title,
                            message: self.message,
                            date: self.datePickerDate,
                            isEdit: self.isEdit
                        )
                        self.presentationMode.wrappedValue.dismiss()
                    }
                )

            }
        }
    }
}

struct NewMemoryView_Previews: PreviewProvider {
    static var previews: some View {
//        NewMemoryView(title: "Тест", isEdit: true)
        NewMemoryView()
    }
}
