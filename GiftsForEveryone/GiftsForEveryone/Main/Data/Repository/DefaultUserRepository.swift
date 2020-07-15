//
//  DefaultUserRepository.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

final class DefaultUserRepository {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
}

extension DefaultUserRepository: UserRepository {
    
    func getUser(completion: @escaping (Result<[UserDomainModel], DomainError>) -> Void) -> Cancelable? {
        
        let repositoryTask = RepositoryTask()
        let service = UserService.me
        
        repositoryTask.task = networkClient.request(service: service) { (result: Result<UserResponse, DataError>) in
            switch result {
            case let .success(respone):
                let data = respone.results
                completion(.success(data.map { $0.toDomain() }))
            case let .failure(error):
                completion(.failure(error.toDomain()))
            }
        }
        
        return repositoryTask
    }
}
