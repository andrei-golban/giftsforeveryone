//
//  InputCoordinator.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/10/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class InputCoordinator: BaseCoordinator {
    
    private let dependency: Dependency
    
    init(dependency: Dependency) {
        self.dependency = dependency
        super.init()
    }
    
    override func start() {
        let getUserUseCase = dependency.resolveDefaultGetUserUseCase()
        let getGiftUseCase = dependency.resolveDefaultGetGiftUseCase()
        let viewModel = InputViewModel(getUserUseCase: getUserUseCase, getGiftUseCase: getGiftUseCase)
        let viewController = InputViewController(viewModel: viewModel)
        
        viewController.coordinator = self
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    func showResultScreen(result: ResultPresentationModel) {
        let viewModel = ResultViewModel(result: result)
        let viewController = ResultViewController(viewModel: viewModel)
        
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
