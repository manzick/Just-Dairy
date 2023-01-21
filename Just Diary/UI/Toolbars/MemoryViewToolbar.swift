//
//  MemoryViewToolbar.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 16.01.2023.
//

import SwiftUI

struct MemoryViewToolbar: ToolbarContent {
    
    let close: () -> Void
    let delete: () -> Void
    let edit: () -> Void
    
    @State private var deleteConfirmation = false

    var body: some ToolbarContent {
    #if os(iOS)
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                self.close()
            }) {
                Image(systemName: "multiply").imageScale(.large)
            }
        }
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                deleteConfirmation = true
            }) {
                Image(systemName: "trash")
                    .imageScale(.large)
                    .foregroundColor(.red)
            }
            .confirmationDialog(
                R.string.memoryViewToolbar.deleteAlertTitle,
                isPresented: $deleteConfirmation,
                titleVisibility: .visible
            ) {
                Button(
                    R.string.memoryViewToolbar.deleteAlertButton,
                    role: .destructive
                ) {
                    self.delete()
                }
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                self.edit()
            }) {
                Text(R.string.memoryViewToolbar.edit)
            }
        }
    #else
        ToolbarItem(placement: .automatic) {
        }
    #endif
    }
}

struct MemoryViewToolbar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("")
                .toolbar {
                    MemoryViewToolbar(
                        close: {},
                        delete: {},
                        edit: {}
                    )
                }
        }
    }
}

