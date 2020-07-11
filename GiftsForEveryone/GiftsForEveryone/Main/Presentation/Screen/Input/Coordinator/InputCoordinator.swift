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
        let viewModel = InputViewModel()
        let viewController = InputViewController(viewModel: viewModel)
        
        viewController.coordinator = self
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    func showResultScreen() {
        
    }
}
