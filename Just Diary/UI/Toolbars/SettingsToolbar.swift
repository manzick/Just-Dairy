//
//  SettingsToolbar.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import SwiftUI

struct SettingsToolbar: ToolbarContent {
    
    @State var showAboutDeveloperSV = false

    var body: some ToolbarContent {
    #if os(iOS)
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                print()
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
                    SettingsToolbar()
                }
        }
    }
}
