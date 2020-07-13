//
//  Flowers.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

struct Flowers {
    
    let name: String
}

extension Flowers: Gift {
    
    var description: String {
        return name
    }
}
