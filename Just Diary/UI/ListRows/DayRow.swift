//
//  DayRow.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import SwiftUI

struct DayRow: View {

    @State var title: String
    @State var date: String
    @State var message: String
    @State var id: UUID
    
    @State private var deleteConfirmation = false

    var body: some View {
        VStack {
            Text(title.firstCharOnly())
                .font(.system(size: 36, weight: .semibold))
                .foregroundColor(R.color.dayTitle)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(date)
                .foregroundColor(R.color.dayDate)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 1)
            
            Text(message)
                .lineLimit(3)
                .frame(maxWidth: .infinity, alignment: .leading)

        }
        .swipeActions {
            Button(action: {
                deleteConfirmation = true
                LocalRxDataManager.shared.removeMemory(
                    byId: id
                )
            }) {
                Image(systemName: "trash").imageScale(.large)
            }
            .tint(.red)
            .confirmationDialog(
                R.string.memoryViewToolbar.deleteAlertTitle,
                isPresented: $deleteConfirmation,
                titleVisibility: .visible
            ) {
                Button(
                    R.string.memoryViewToolbar.deleteAlertButton,
                    role: .destructive
                ) {
//                    self.delete()
                }
            }
            
            Button(action: {
                print("Awesome!")
            }) {
                Image(systemName: "star.fill").imageScale(.large)
            }
            .tint(.blue)
        }

    }
}

struct DayRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Section {
                DayRow(
                    title: "очень умное название и длинное",
                    date: "02.16.2022",
                    message: "Ну я пока все тут же. Из планов только «не праздновать следующий НГ в Казахстане, и в принципе не хотелось бы видеть снег на след новый год»",
                    id: UUID()
                )
//                    .previewLayout(.fixed(width: 500, height: 120))
                    
            }
        }
        
    }
}
