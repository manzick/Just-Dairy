//
//  SettingsView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 07.01.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State var showAboutDeveloperSV = false

    var body: some View {
        List {
            Section {
                Button(action: {
                    print()
                }) {
                    HStack{
                        Image(systemName: "icloud.and.arrow.down").imageScale(.large)
                        Text(R.string.settings.load)
                    }
                }
                
                Button(action: {
                    print()
                }) {
                    HStack{
                        Image(systemName: "icloud.and.arrow.up").imageScale(.large)
                        Text(R.string.settings.save)
                    }
                }
            } header: {
                Text(R.string.settings.cloudHeader)
            }
        }
        .navigationTitle(R.string.settings.title)
        .navigationBarItems(trailing:
            Button(action: {
                print()
            self.showAboutDeveloperSV.toggle()
            }) {
                Text(R.string.aboutDeveloper.title)
            }.sheet(isPresented: $showAboutDeveloperSV) {
                AboutDeveloperView()
            }
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}

