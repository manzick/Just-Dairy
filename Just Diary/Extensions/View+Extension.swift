//
//  View+Extension.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 14.01.2023.
//

import SwiftUI

#if canImport(UIKit)
@available(iOS 15, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension View {
    @ViewBuilder
    public func activityView(isPresented: Binding<Bool>, items: [Any]) -> some View {
        if isPresented.wrappedValue {
            self
                .sheet(
                    isPresented: isPresented,
                    content: {
                        ActivityView(
                            activityItems: items,
                            applicationActivities: nil
                        )
                    }
                )
        } else {
            self
        }
    }
}
#endif
