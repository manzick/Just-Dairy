//
//  MainToolbar.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import SwiftUI

struct MainToolbar: ToolbarContent {
    
    @State private var showNewMemoryModal = false
    
    @State var showSettingsMacOSSV = false

    var body: some ToolbarContent {
    #if os(iOS)
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
    #else
        ToolbarItem(placement: .primaryAction) {
            Button(action: {
                print()
            self.showSettingsMacOSSV.toggle()
            }) {
                Image(systemName: "gear").imageScale(.large)
            }.sheet(isPresented: $showSettingsMacOSSV) {
                SettingsView()
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

