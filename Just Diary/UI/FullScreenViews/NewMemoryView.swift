//
//  NewMemoryView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 07.01.2023.
//

import SwiftUI

struct NewMemoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var exitItem: Bool?
    
    @State var title = ""
    @State var message = ""
    @State private var datePickerDate = Date.now

    var body: some View {
        NavigationView {
            List {
                Section{
                    TextField(
                        "Type title of memory",
                        text: $title
                    )
                    DatePicker(
                        selection: $datePickerDate,
                        in: ...Date.now,
                        displayedComponents: .date) {
                            Text("Select a date")
                        }
                }
                .onTapGesture {
//                    hideKeyboard()
                }
                Section {
                    TextEditor(
                        text: $message
                    )
                    .frame(minHeight: 250)
                }
            }
            .navigationTitle(R.string.newMemory.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NewMemoryToolbar(
                    close: {
                        self.presentationMode.wrappedValue.dismiss()
                    },
                    save: {
                        LocalRxDataManager.shared.addMemory(
                            title: self.title,
                            message: self.message,
                            date: self.datePickerDate
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
        NewMemoryView()
    }
}

//extension View {
//    func hideKeyboard() {
//        let resign = #selector(UIResponder.resignFirstResponder)
//        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
//    }
//}

//struct Background<Content: View>: View {
//    private var content: Content
//
//    init(@ViewBuilder content: @escaping () -> Content) {
//        self.content = content()
//    }
//
//    var body: some View {
//        Color.white
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        .overlay(content)
//    }
//}
