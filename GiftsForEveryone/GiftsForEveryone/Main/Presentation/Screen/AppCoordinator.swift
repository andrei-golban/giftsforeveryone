//
//  AppCoordinator.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/10/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    var window: UIWindow
    
    let dependency = Dependency.shared
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        showSplashScreen()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.showInputScreen()
        }
    }
    
    func showInputScreen() {
        let coordinator = InputCoordinator(dependency: dependency)
        coordinator.navigationController = navigationController
        
        coordinate(coordinator: coordinator)
    }
    
    private func showSplashScreen() {
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() ?? UIViewController()
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([viewController], animated: false)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
