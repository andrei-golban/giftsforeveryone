//
//  DefaultJSONDecoder.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/13/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

final class DefaultJSONDecoder: JSONDecoder {
    
    private let dateFormatter = DateFormatter()
    
    private let dateFormat: String
    
    init(dateFormat: String) {
        self.dateFormat = dateFormat
        super.init()
        configure()
    }
    
    private func configure() {
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateDecodingStrategy = .formatted(dateFormatter)
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
