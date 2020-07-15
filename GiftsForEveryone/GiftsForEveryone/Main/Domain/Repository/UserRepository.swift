//
//  UserRepository.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

protocol UserRepository: class {
    
    func getUser(completion: @escaping (Result<[UserDomainModel], DomainError>) -> Void) -> Cancelable?
}
