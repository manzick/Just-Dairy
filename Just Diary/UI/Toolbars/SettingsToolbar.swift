//
//  SettingsToolbar.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import SwiftUI

struct SettingsToolbar: ToolbarContent {
    
    @State var showAboutDeveloperSV = false
    @State var showStatisticSV = false
    
    let close: () -> Void

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
                self.showStatisticSV.toggle()
            }) {
                Image(systemName: "info.circle").imageScale(.large)
            }.sheet(isPresented: $showStatisticSV) {
                StatisticView()
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                self.showAboutDeveloperSV.toggle()
            }) {
                Text(R.string.aboutDeveloper.title)
            }.sheet(isPresented: $showAboutDeveloperSV) {
                AboutDeveloperView()
            }
        }
    #else
        ToolbarItem(placement: .automatic) {
        }
    #endif
    }
}

struct SettingsToolbar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("")
                .toolbar {
                    SettingsToolbar(close: {})
                }
        }
    }
}
