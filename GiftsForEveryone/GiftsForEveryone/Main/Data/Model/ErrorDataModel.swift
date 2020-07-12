//
//  ErrorDataModel.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

struct ErrorDataModel: Decodable, Error {
    
    let error: String
}

extension ErrorDataModel {
    
    func toDomain() -> ErrorDomainModel {
        return .init(failureReason: NSLocalizedString(error, comment: ""))
    }
}
