//
//  NewMemoryToolbar.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import SwiftUI

struct NewMemoryToolbar: ToolbarContent {
    
    let close: () -> Void
    let save: () -> Void
    
    @State private var exitConfirmation = false

    var body: some ToolbarContent {
    #if os(iOS)
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                exitConfirmation = true
            }) {
                Image(systemName: "multiply").imageScale(.large)
            }
            .confirmationDialog(
                R.string.newMemoryToolbar.exitAlertTitle,
                isPresented: $exitConfirmation,
                titleVisibility: .visible
            ) {
                Button(
                    R.string.newMemoryToolbar.exitAlertButton,
                    role: .destructive
                ) {
                    self.close()
                }
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                self.save()
            }) {
                Text(R.string.newMemory.save)
            }
        }
    #else
        ToolbarItem(placement: .automatic) {
        }
    #endif
    }
}

struct NewMemoryToolbar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("")
                .toolbar {
                    NewMemoryToolbar(close: {}, save: {})
                }
        }
    }
}
