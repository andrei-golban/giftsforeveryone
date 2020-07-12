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
}

extension DomainError {
    
    var localizedDescription: String {
        switch self {
        case .noInternetConnection:
            return NSLocalizedString("no.internet.connection", comment: "")
        case .dataCorrupted:
            return NSLocalizedString("bad.data.received", comment: "")
        case let .underlying(error):
            return error.failureReason
        case .undefined:
            return NSLocalizedString("bad.response", comment: "")
        }
    }
}
