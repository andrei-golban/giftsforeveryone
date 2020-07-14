//
//  InputCoordinator.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/10/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class InputCoordinator: BaseCoordinator {
    
    override func start() {
        let decoder = DefaultJSONDecoder()
        let networkClient = DefaultNetworkClient(session: .shared, decoder: decoder)
        let userRepository = DefaultUserRepository(networkClient: networkClient)
        let getUserUseCase = DefaultGetUserUseCase(userRepository: userRepository)
        let holidayStore = DefaultHolidayStore()
        let giftStore = DefaultGiftStore(holidayStore: holidayStore)
        let getGiftUseCase = DefaultGetGiftUseCase(giftStore: giftStore)
        let viewModel = InputViewModel(getUserUseCase: getUserUseCase, getGiftUseCase: getGiftUseCase)
        let viewController = InputViewController(viewModel: viewModel)
        
        viewController.coordinator = self
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    func showResultScreen(gifts: [Gift]) {
        let viewModel = ResultViewModel(gifts: gifts)
        let viewController = ResultViewController(viewModel: viewModel)
        
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
