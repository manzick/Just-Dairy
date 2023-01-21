//
//  StatisticRow.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 21.01.2023.
//

import SwiftUI

struct StatisticRow: View {

    @State var name: String
    @State var value: String

    var body: some View {
        HStack{
            Text(name)
            Spacer()
            Text(value)
                .foregroundColor(R.color.dayDate)
        }
    }
}

struct StatisticRow_Previews: PreviewProvider {
    static var previews: some View {
        StatisticRow(
            name: "Количество записей",
            value: "3"
        )
            .previewLayout(.fixed(width: 500, height: 120))
    }
}
