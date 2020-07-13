//
//  Orange.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

struct Orange {
    
    let name: String
    
    let quantity: Int
}

extension Orange: Gift {
    
    var description: String {
        let chocolateFormat = NSLocalizedString("orange", comment: "")
        let pluralFormat = NSLocalizedString("orange_count", comment: "")
        let pluralName = String.localizedStringWithFormat(pluralFormat, quantity)
        return String.localizedStringWithFormat(chocolateFormat, quantity, pluralName)
    }
}
