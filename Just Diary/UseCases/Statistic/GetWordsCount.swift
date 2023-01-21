//
//  GetWordsCount.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 21.01.2023.
//

import Foundation

extension UseCases {
    func getWordsCountString() -> String {
        let memories = LocalRxDataManager.shared.getMemories().value
        var count: Int = 0
        for memory in memories {
            let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
            let components = memory.message.components(separatedBy: chararacterSet)
            let words = components.filter { !$0.isEmpty }
            count += words.count
        }
        return "\(count)"
    }
}
