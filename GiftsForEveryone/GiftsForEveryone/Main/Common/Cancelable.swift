//
//  Cancelable.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

protocol Cancelable: class {
    
    var isCanceled: Bool { get set }
    
    func cancel()
}
