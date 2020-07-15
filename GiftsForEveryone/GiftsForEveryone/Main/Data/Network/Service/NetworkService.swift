//
//  NetworkService.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

protocol NetworkService {
    
    var baseURL: String { get }
    
    var method: String { get }
    
    var path: String { get }
    
    func asUrlRequest() -> URLRequest
}
