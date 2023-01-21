//
//  StatisticView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 21.01.2023.
//

import SwiftUI

struct StatisticView: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List {
                Section{
                    StatisticRow(
                        name: R.string.statistic.memoriesCount,
                        value: UseCases.shared.getMemoriesCountString()
                    )
                    StatisticRow(
                        name: R.string.statistic.wordsCount,
                        value: UseCases.shared.getWordsCountString()
                    )
                    StatisticRow(
                        name: R.string.statistic.yearCount,
                        value: UseCases.shared.getYearCountString()
                    )
                }
            }
            .navigationTitle(R.string.statistic.title)
            .toolbar {
                JustCloseToolbar(close: {
                    self.dismiss()
                })
            }
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
    }
}
