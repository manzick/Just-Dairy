//
//  GetMemoriesCount.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 21.01.2023.
//

import Foundation

extension UseCases {
    func getMemoriesCountString() -> String {
        return "\(LocalRxDataManager.shared.getMemories().value.count)"
    }
}
