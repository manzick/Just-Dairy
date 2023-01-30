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
//                DayRow(
//                    title: "очень умное название и длинное",
//                    date: "02.16.2022",
//                    message: "Ну я пока все тут же. Из планов только «не праздновать следующий НГ в Казахстане, и в принципе не хотелось бы видеть снег на след новый год»"
//                )

                DayRow(
                    day: DayModel(
                        title: "очень умное название и длинное",
                        message: "Ну я пока все тут же. Из планов только «не праздновать следующий НГ в Казахстане, и в принципе не хотелось бы видеть снег на след новый год»",
                        date: "02.16.2022",
                        id: UUID()
                    )
                )
                    
            }
        }
        
    }
}
