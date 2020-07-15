//
//  Observable.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/13/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

final class Observable<T> {
    
    typealias Observer = (T) -> Void
    
    private var observer: Observer?
    
    var value: T? {
        didSet { notifyObserver() }
    }
    
    init(value: T? = nil) {
        self.value = value
    }
    
    func observe(observer: Observer?) {
        self.observer = observer
        notifyObserver()
    }
    
    private func notifyObserver() {
        guard let value = value else { return }
        observer?(value)
    }
}
