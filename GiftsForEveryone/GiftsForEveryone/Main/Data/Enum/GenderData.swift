//
//  GenderData.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/15/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

enum GenderData: String, Decodable {
    
    case male
    
    case female
}

extension GenderData {
    
    func toDomain() -> Gender {
        switch self {
        case .male:
            return Gender.male
        case .female:
            return Gender.female
        }
    }
}
