//
//  Coordinator.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import Foundation

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childrenCoordinator: [Coordinator] { get set }
    func start()
    func finish()
    func addChildCoordinator(_ coordinator: Coordinator)
    func removeChildCoordinator(_ coordinator: Coordinator)
}

extension Coordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        childrenCoordinator.append(coordinator)
        coordinator.parentCoordinator = self
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childrenCoordinator = childrenCoordinator.filter { $0 !== coordinator }
    }
    
    func finish() {
        parentCoordinator?.removeChildCoordinator(self)
        childrenCoordinator.removeAll()
    }
}
