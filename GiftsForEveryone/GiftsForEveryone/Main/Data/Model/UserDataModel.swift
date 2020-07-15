//
//  UserDataModel.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

struct UserDataModel: Decodable {
    
    let birthday: Date

    let gender: GenderData

    enum CodingKeys: String, CodingKey {
        case gender
        case dob
        case date
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gender = try container.decode(GenderData.self, forKey: .gender)

        let dobContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .dob)
        birthday = try dobContainer.decode(Date.self, forKey: .date)
    }
}

extension UserDataModel {
    
    func toDomain() -> UserDomainModel {
        return .init(birthday: birthday,
                     gender: gender.toDomain())
    }
}
