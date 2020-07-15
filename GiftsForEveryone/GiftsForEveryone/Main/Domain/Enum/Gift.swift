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
    
    case chocolate(quantity: Int, color: ChocolateColor, size: ChocolateSize)
    
    case orange(quantity: Int)
    
    case book
    
    case socks
    
    case flowers
    
    var localizedString: String {
        switch self {
        case .lego:
            return Localizable.Global.lego.localized
        case let .chocolate(quantity, size, color):
            let format = Localizable.Global.chocolate.localized
            let pluralFormat = Localizable.Plural.chocolateCount.localized
            let pluralChocolate = String(format: pluralFormat, quantity)
            return String(format: format, quantity, size.localizedString, color.localizedString, pluralChocolate)
        case let .orange(quantity):
            let format = Localizable.Global.orange.localized
            let pluralFormat = Localizable.Plural.orangeCount.localized
            let pluralOrange = String(format: pluralFormat, quantity)
            return String(format: format, quantity, pluralOrange)
        case .book:
            return Localizable.Global.book.localized
        case .socks:
            return Localizable.Global.socks.localized
        case .flowers:
            return Localizable.Global.flowers.localized
        }
    }
}

enum ChocolateSize {
    
    case small
    
    case medium
    
    case big
    
    var localizedString: String {
        switch self {
        case .small:
            return Localizable.Global.small.localized
        case .medium:
            return Localizable.Global.medium.localized
        case .big:
            return Localizable.Global.big.localized
        }
    }
}

enum ChocolateColor {
    
    case white
    
    case black
    
    var localizedString: String {
        switch self {
        case .white:
            return Localizable.Global.white.localized
        case .black:
            return Localizable.Global.black.localized
        }
    }
}
