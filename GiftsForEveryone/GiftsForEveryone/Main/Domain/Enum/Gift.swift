//
//  Gift.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

enum Gift {
    
    case lego
    
    case chocolate(quantity: Int, size: ChocolateSize, color: ChocolateColor)
    
    case orange(quantity: Int)
    
    case book
    
    case socks
    
    case flowers
    
    var name: String {
        switch self {
        case .lego:
            return "Lego"
        case let .chocolate(quantity, color, size):
            return "\(quantity) \(size) \(color) chocolate"
        case let .orange(quantity):
            return "\(quantity) orange"
        case .book:
            return "Book"
        case .socks:
            return "Socks"
        case .flowers:
            return "Flowers"
        }
    }
}

enum ChocolateSize {
    
    case small
    
    case medium
    
    case big
}

enum ChocolateColor {
    
    case white
    
    case black
}
