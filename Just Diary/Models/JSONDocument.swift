//
//  JSONDocument.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 14.01.2023.
//

import SwiftUI
import UniformTypeIdentifiers

class JSONDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.json] }
    
    var content: String

    init(contentString content: String) {
        self.content = content
    }

    required init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        content = string
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: content.data(using: .utf8)!)
    }
    
    
}
