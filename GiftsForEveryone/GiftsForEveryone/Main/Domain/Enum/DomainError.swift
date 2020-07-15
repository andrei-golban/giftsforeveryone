//
//  DomainError.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

enum DomainError: Error {
    
    case noInternetConnection
    
    case dataCorrupted
    
    case underlying(error: ErrorDomainModel)
    
    case undefined
    
    case birthdayFieldEmpty
    
    case genderFieldEmpty
    
    case currentDateEmpty
}

extension DomainError {
    
    var localizedDescription: String {
        switch self {
        case .noInternetConnection:
            return Localizable.Error.noInternetConnection.localized
        case .dataCorrupted:
            return Localizable.Error.badDataReceived.localized
        case let .underlying(error):
            return error.failureReason
        case .undefined:
            return Localizable.Error.badResponse.localized
        case .birthdayFieldEmpty:
            return Localizable.Error.birthdayFieldEmpty.localized
        case .genderFieldEmpty:
            return Localizable.Error.genderFieldEmpty.localized
        case .currentDateEmpty:
            return Localizable.Error.currentDateEmpty.localized
        }
    }
}
