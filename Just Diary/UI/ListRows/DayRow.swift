//
//  DayRow.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import SwiftUI

struct DayRow: View {

//    @State var title: String
//    @State var date: String
//    @State var message: String
    @ObservedObject var day: DayModel

    var body: some View {
        VStack {
            Text(day.title.firstCharOnly())
                .font(.system(size: 36, weight: .semibold))
                .foregroundColor(R.color.dayTitle)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(day.date)
                .foregroundColor(R.color.dayDate)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 1)
            
            Text(day.message)
                .foregroundColor(R.color.dayTitle)
                .lineLimit(3)
                .frame(maxWidth: .infinity, alignment: .leading)

        }
    }
}

struct DayRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Section {
                DayRow(
                    day: DayModel(
                        title: "Very clever title. And very-very looong",
                        message: "Well, I'm still here. From plans only «not to celebrate the next New Year in Kazakhstan, and in principle would not like to see snow on the next New Year's Eve.»",
                        date: "02.16.2022",
                        id: UUID()
                    )
                )
                    
            }
        }
        
    }
}
