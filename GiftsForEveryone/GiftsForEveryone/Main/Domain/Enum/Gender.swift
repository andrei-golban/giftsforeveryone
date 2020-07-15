//
//  Gender.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

enum Gender: Int, CaseIterable {
    
    case male
    
    case female
    
    var localizedString: String {
        switch self {
        case .male:
            return Localizable.Global.male.localized
        case .female:
            return Localizable.Global.female.localized
        }
    }
}
