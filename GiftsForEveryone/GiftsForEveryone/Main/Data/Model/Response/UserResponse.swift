//
//  UserResponse.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

struct UserResponse: Decodable {
    
    let results: [UserDataModel]
}
