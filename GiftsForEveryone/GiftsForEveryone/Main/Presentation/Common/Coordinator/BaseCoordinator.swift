//
//  BaseCoordinator.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/10/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    
    var id: String { get }
    
    var parent: Coordinator? { get set }
    
    var childCoordinators: [String: Coordinator] { get set }
    
    var navigationController: UINavigationController { get set }
    
    func start()
    
    func finish(coordinator: Coordinator)
    
    func coordinate(coordinator: Coordinator)
    
    func removeChildCoordinators()
}

class BaseCoordinator: Coordinator {

    let id = UUID().uuidString
    
    weak var parent: Coordinator?
    
    var childCoordinators = [String : Coordinator]()
    
    var navigationController: UINavigationController = AppNavController()
    
    func start() {
        fatalError("start method has not been implemented")
    }
    
    func finish(coordinator: Coordinator) {
        childCoordinators.removeValue(forKey: coordinator.id)
    }
    
    func coordinate(coordinator: Coordinator) {
        childCoordinators[coordinator.id] = coordinator
        coordinator.parent = self
        coordinator.start()
    }
    
    func removeChildCoordinators() {
        childCoordinators.forEach { $0.value.removeChildCoordinators() }
        childCoordinators.removeAll()
    }
}
