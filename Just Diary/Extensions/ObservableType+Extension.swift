//
//  ObservableType+Extension.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 22.01.2023.
//

import RxSwift
import RxCocoa

extension ObservableType {
    public func withPrevious(startWith first: Element) -> Observable<(Element, Element)> {
        return scan((first, first)) { ($0.1, $1) }.skip(1)
    }
}
