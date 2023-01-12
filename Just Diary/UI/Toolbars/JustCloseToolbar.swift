//
//  AboutDeveloperToolbar.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 12.01.2023.
//

import SwiftUI

struct JustCloseToolbar: ToolbarContent {
    
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
    #else
        ToolbarItem(placement: .automatic) {
        }
    #endif
    }
}

struct AboutDeveloperToolbar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("")
                .toolbar {
                    JustCloseToolbar (close: {})
                }
        }
    }
}
