//
//  UIScreen+Extension.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 21.01.2023.
//

import SwiftUI

#if canImport(UIKit)
extension UIScreen {
   static let width = UIScreen.main.bounds.size.width
   static let height = UIScreen.main.bounds.size.height
   static let size = UIScreen.main.bounds.size
}
#endif
