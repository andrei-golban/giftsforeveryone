//
//  UserDataModel.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

struct UserDataModel: Decodable {
    
    let birthdayDate: Date
    
    let gender: Gender
    
    enum CodingKeys: String, CodingKey {
        case gender
        case dob
        case date
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gender = try container.decode(Gender.self, forKey: .gender)
        
        let dobContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .dob)
        birthdayDate = try dobContainer.decode(Date.self, forKey: .date)
    }
}

extension UserDataModel {
    
    func toDomain() -> UserDomainModel {
        return .init(birthdayDate: birthdayDate,
                     gender: gender)
    }
}
