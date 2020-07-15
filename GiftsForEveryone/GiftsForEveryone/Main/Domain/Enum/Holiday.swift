//
//  Holiday.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/14/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

enum Holiday {
    
    case birthday(date: Date)
    
    case newYear
    
    case march8
    
    case february23
    
    var month: Int {
        switch self {
        case let .birthday(date):
            return date.month
        case .newYear:
            return 12
        case .march8:
            return 3
        case .february23:
            return 2
        }
    }
    
    var day: Int {
        switch self {
        case let .birthday(date):
            return date.day
        case .newYear:
            return 31
        case .march8:
            return 8
        case .february23:
            return 23
        }
    }
}
