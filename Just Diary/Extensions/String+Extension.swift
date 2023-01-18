//
//  String+Extension.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 07.01.2023.
//

import Foundation

extension String {
    public func localize() -> String {
        return Bundle.main.localizedString(forKey: self, value: nil, table: nil)
    }

    func firstCharOnly() -> String {
        return prefix(1).uppercased() + self.dropFirst()
    }
    
}
