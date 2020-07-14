//
//  Box.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/13/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

final class Box<T> {
    
    typealias Listener = (T?) -> Void
    
    var listener: Listener?
    
    var value: T? {
        didSet { listener?(value) }
    }
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
