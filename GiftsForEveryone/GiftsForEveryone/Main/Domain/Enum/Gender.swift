//
//  Gender.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

enum Gender: Int, Decodable, CaseIterable {
    
    case male = 0
    
    case female
    
    var localizedString: String {
        switch self {
        case .male:
            return NSLocalizedString("male", comment: "")
        case .female:
            return NSLocalizedString("female", comment: "")
        }
    }
}
