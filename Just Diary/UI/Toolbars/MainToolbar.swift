//
//  MainToolbar.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import SwiftUI

struct MainToolbar: ToolbarContent {
    
    @State private var showNewMemoryModal = false
    @State var showSettingsSV = false
    @Environment(\.openWindow) var openWindow

    var body: some ToolbarContent {
    #if os(iOS)
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                self.showSettingsSV.toggle()
            }) {
                Image(systemName: "gear").imageScale(.large)
            }.sheet(isPresented: $showSettingsSV) {
                SettingsView()
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
    #else
        ToolbarItem(placement: .primaryAction) {
            Button(action: {
                openWindow(id: R.window.settings)
            }) {
                Image(systemName: "gear").imageScale(.large)
            }
        }
        ToolbarItem(placement: .secondaryAction) {
            Button(action: {
                openWindow(id: R.window.newMemory)
            }) {
                Image(systemName: "square.and.pencil").imageScale(.large)
            }
        }
    #endif
    }
}

struct MainToolbar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("")
                .toolbar {
                    MainToolbar ()
                }
        }
    }
}
