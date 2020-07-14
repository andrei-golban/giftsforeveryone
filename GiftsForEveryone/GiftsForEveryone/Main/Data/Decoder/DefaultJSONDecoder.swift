//
//  DefaultJSONDecoder.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/13/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

final class DefaultJSONDecoder: JSONDecoder {
    
    override init() {
        super.init()
        configure()
    }
    
    private func configure() {
        dateDecodingStrategy = .iso8601
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
