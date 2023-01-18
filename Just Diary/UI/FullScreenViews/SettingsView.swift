//
//  SettingsView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 07.01.2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct SettingsView: View {
    
    @State private var showingShareActivity: Bool = false
//    @State private var showingExporterToSave: Bool = false
    @State private var showingImporter: Bool = false
    
    @State private var mergeOrNewConfirmation = false
    @State private var loadJSONFailed = false

    var body: some View {
        List {
            Section {
                Button(action: {
                    self.showingImporter.toggle()
                }) {
                    HStack{
                        Image(systemName: "icloud.and.arrow.down").imageScale(.large)
                        Text(R.string.settings.load)
                    }
                }

                Button(action: {
                    self.showingShareActivity = true
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
        .fileImporter(
            isPresented: $showingImporter,
            allowedContentTypes: [.json],
            allowsMultipleSelection: false
        ) { result in
            JSONDataManager.shared.openDocument(by: result) { isSuccess in
                if isSuccess {
                    self.mergeOrNewConfirmation = true
                } else {
                    self.loadJSONFailed = true
                }
            }
        }
//        .fileExporter(
//            isPresented: $showingExporterToSave,
//            document: JSONDataManager.shared.getDocument(),
//            contentType: .json,
//            defaultFilename: "Message"
//        ) { result in
//            switch result {
//            case .success(let url):
//                print("Saved to \(url)")
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        .confirmationDialog(
            R.string.settings.loadDialogTitle,
            isPresented: $mergeOrNewConfirmation,
            titleVisibility: .visible
        ) {
            Button(R.string.settings.merge) {
                JSONDataManager.shared.mergeWithDocument()
            }
            Button(R.string.settings.rewrite) {
                JSONDataManager.shared.replaceFromDocument()
            }
        }
        .alert(
            R.string.settings.loadDataFailed,
            isPresented: $loadJSONFailed
        ) {
            Button(
                R.string.ok,
                role: .cancel
            ) { }
        }
        #if os(iOS)
        .activityView(
            isPresented: $showingShareActivity,
            items: [
                UseCases.shared.getJSONDocument(isCalled: showingShareActivity)
            ]
        )
        #endif
        .navigationTitle(R.string.settings.title)
        .toolbar {
            SettingsToolbar()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}

