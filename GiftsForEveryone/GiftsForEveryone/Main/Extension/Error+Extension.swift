//
//  Error+Extension.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/15/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

extension Error {
    
    var isNetworkConnetionError: Bool {
        let error = self as NSError
        let networkErrors = [NSURLErrorNetworkConnectionLost, NSURLErrorNotConnectedToInternet]
        return networkErrors.contains(error.code)
    }
}
