//
//  GetUserUseCase.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

protocol GetUserUseCase: class {
    
    @discardableResult
    func execute(completion: @escaping (Result<UserDomainModel, DomainError>) -> Void) -> Cancelable?
}

final class DefaultGetUserUseCase {
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
}

extension DefaultGetUserUseCase: GetUserUseCase {
    
    func execute(completion: @escaping (Result<UserDomainModel, DomainError>) -> Void) -> Cancelable? {
        return userRepository.getUser(completion: completion)
    }
}
