//
//  String.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 07.01.2023.
//

import Foundation

extension R {
    struct string {
        static let text = "Text"
        struct link {
            static let manzickTwitterLink = "https://mobile.twitter.com/manzick"
            static let manzickTelegramLink = "https://t.me/manzick"
        }
        struct yearList {
            static let title = "Just Dairy".localize()
        }
        struct aboutDeveloper {
            static let title = "About Developer".localize()
            static let sourceButton = "Source link".localize()
        }
        struct settings {
            static let title = "Settings".localize()
            static let cloudHeader = "Backup to iCloud (now to files)".localize()
            static let load = "Load".localize()
            static let save = "Save".localize()
        }
        struct newMemory {
            static let title = "New memory".localize()
            static let save = "newMemory.Save".localize()
        }
    }
}
