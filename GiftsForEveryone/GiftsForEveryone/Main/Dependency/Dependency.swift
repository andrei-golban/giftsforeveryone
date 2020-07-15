//
//  Dependency.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/15/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

final class Dependency {
    
    static let shared = Dependency()
    
    private lazy var defaultNetworkClient: NetworkClient = {
        let session = URLSession.shared
        let decoder = resolveDefaultJSONDecoder()
        let networkClient = DefaultNetworkClient(session: session, decoder: decoder)
        return networkClient
    }()
    
    func resolveDefaultJSONDecoder() -> JSONDecoder {
        return DefaultJSONDecoder(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    }
    
    func resolveDefaultNetworkClient() -> NetworkClient {
        return defaultNetworkClient
    }
    
    func resolveDefaultUserRepository() -> UserRepository {
        let networkClient = resolveDefaultNetworkClient()
        return DefaultUserRepository(networkClient: networkClient)
    }
    
    func resolveDefaultHolidayStore() -> HolidayStore {
        return DefaultHolidayStore()
    }
    
    func resolveDefaultGiftStore() -> GiftStore {
        let holidayStore = resolveDefaultHolidayStore()
        return DefaultGiftStore(holidayStore: holidayStore)
    }
    
    func resolveDefaultGetGiftUseCase() -> GetGiftUseCase {
        let giftStore = resolveDefaultGiftStore()
        return DefaultGetGiftUseCase(giftStore: giftStore)
    }
    
    func resolveDefaultGetUserUseCase() -> GetUserUseCase {
        let userRepository = resolveDefaultUserRepository()
        return DefaultGetUserUseCase(userRepository: userRepository)
    }
}
