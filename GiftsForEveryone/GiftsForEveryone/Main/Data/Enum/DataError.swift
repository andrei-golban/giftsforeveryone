//
//  DataError.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

enum DataError: Error {
    
    case noInternetConnection
    
    case dataCorrupted
    
    case underlying(error: ErrorDataModel)
    
    case undefined
}

extension DataError {
    
    func toDomain() -> DomainError {
        switch self {
        case .noInternetConnection:
            return .noInternetConnection
        case .dataCorrupted:
            return .dataCorrupted
        case let.underlying(error):
            return .underlying(error: error.toDomain())
        case .undefined:
            return .undefined
        }
    }
}
