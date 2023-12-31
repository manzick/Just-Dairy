//
//  Just_DiaryApp.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 28.12.2022.
//

import SwiftUI

@main
struct Just_DiaryApp: App {
    let ddm = DatabaseDataManager.shared
    var body: some Scene {
        WindowGroup {
            MainList()
        }
        WindowGroup("NewMemory", id: R.window.newMemory) {
            NewMemoryView()
        }
        WindowGroup("Settings", id: R.window.settings) {
            SettingsView()
        }
    }
}
