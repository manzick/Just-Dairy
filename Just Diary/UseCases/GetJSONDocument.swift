//
//  GetJSONDocument.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 16.01.2023.
//

import Foundation

extension UseCases {
    //Оптимизация. Проблема в функции activityView, которая дергает getDocument на каждой отрисовке
    //На данном этапе изучения SwiftUI не вижу других способов исправить проблему
    func getJSONDocument(isCalled: Bool = true) -> URL {
        guard isCalled else { return URL(fileURLWithPath: "") }
        return JSONDataManager.shared.getDocument()
    }
}
