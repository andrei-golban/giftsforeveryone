//
//  BuildConfig.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/10/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

final class BuildConfig {
    
    private enum Key: String {
        case configuration
        case apiURL
    }
    
    private init() {}
    
    private static var infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary,
            let configuration = dict[Key.configuration.rawValue] as? [String: Any] else {
                fatalError("Plist file not found")
        }
        return configuration
    }()
    
    static var apiURL: String = {
        guard let apiURL = infoDictionary[Key.apiURL.rawValue] as? String else {
            fatalError("API URL not set in plist configuration file")
        }
        return apiURL.replacingOccurrences(of: "\\", with: "")
    }()
    
    static var debug: Bool = {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }()
}
