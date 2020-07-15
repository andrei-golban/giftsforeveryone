//
//  Localizable.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/14/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

protocol LocalizableDelegate {
    
    var rawValue: String { get }
    
    var localized: String { get }
}

extension LocalizableDelegate {
    
    var localized: String {
        return NSLocalizedString(rawValue, comment: "")
    }
}

enum Localizable {
    
    enum Global: String, LocalizableDelegate {
        case birthday
        case gender
        case currentDate
        case male
        case female
        case lego
        case chocolate
        case orange
        case book
        case socks
        case flowers
        case big
        case medium
        case small
        case white
        case black
        case receivedGifts
        case resultFormat
        case ok
    }
    
    enum InputScreen: String, LocalizableDelegate {
        case inputTitle
        case randomizeInput
        case receive
    }
    
    enum ResultScreen: String, LocalizableDelegate {
        case resultTitle
    }
    
    enum Error: String, LocalizableDelegate {
        case error
        case noInternetConnection
        case badDataReceived
        case badResponse
        case birthdayFieldEmpty
        case genderFieldEmpty
        case currentDateEmpty
    }
    
    enum Plural: String, LocalizableDelegate {
        case chocolateCount
        case orangeCount
    }
}
