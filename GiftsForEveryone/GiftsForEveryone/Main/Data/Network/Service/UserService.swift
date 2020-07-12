//
//  UserService.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

enum UserService: NetworkService {
    
    case me
    
    var baseURL: String {
        return BuildConfig.apiURL
    }
    
    var method: String {
        switch self {
        case .me:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .me:
            return "/api"
        }
    }
    
    func asUrlRequest() -> URLRequest {
        let url = URL(string: baseURL)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method
        return urlRequest
    }
}
