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
        static let ok = "OK"
        struct link {
            static let manzickTwitterLink = "https://mobile.twitter.com/manzick"
            static let manzickTelegramLink = "https://t.me/manzick"
        }
        struct model {
            static let noName = "Untitled".localize()
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
            static let loadDialogTitle = "loadDialogTitle".localize()
            static let merge = "Merge".localize()
            static let rewrite = "Rewrite".localize()
            static let loadDataFailed = "Load data from JSON failed".localize()
        }
        struct newMemory {
            static let title = "New memory".localize()
            static let save = "newMemory.Save".localize()
        }
        struct newMemoryToolbar {
            static let exitAlertTitle = "exitAlertTitle".localize()
            static let exitAlertButton = "exitAlertButton".localize()
        }
    }
}
