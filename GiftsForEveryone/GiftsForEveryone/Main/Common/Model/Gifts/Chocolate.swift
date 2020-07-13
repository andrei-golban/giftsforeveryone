//
//  Chocolate.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

struct Chocolate {
    
    let name: String
    
    let quantity: Int
    
    let size: Size
    
    enum Size: String {
        case big, medium, small
    }
}

extension Chocolate: Gift {
    
    var description: String {
        let chocolateFormat = NSLocalizedString("chocolate", comment: "")
        let pluralFormat = NSLocalizedString("chocolate_count", comment: "")
        let pluralName = String.localizedStringWithFormat(pluralFormat, quantity)
        return String.localizedStringWithFormat(chocolateFormat, quantity, size.rawValue, pluralName)
    }
}
