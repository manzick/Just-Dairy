//
//  ActivityView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 14.01.2023.
//

import SwiftUI

#if canImport(UIKit)
@available(iOS 15, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
struct ActivityView: UIViewControllerRepresentable {

    let activityItems: [Any]
    let applicationActivities: [UIActivity]?

    func makeUIViewController(
        context: UIViewControllerRepresentableContext<ActivityView>
    ) -> UIActivityViewController {
        
        return UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities
        )
    }

    func updateUIViewController(
        _ uiViewController: UIActivityViewController,
        context: UIViewControllerRepresentableContext<ActivityView>
    ) {

    }
    
}
#endif

