//
//  AppCoordinator.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import UIKit

final class AppCoordinator: AppCoordinatorProtocol {
    let window: UIWindow
    weak var parentCoordinator: Coordinator?
    var childrenCoordinator: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        openHomeScene()
    }
    
    func openHomeScene() {
        let coordinator = HomeCoordinator(navigationController: UINavigationController())
        window.rootViewController = coordinator.navigationController
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}
