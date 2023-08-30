//
//  HomeCoordinator.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    var childrenCoordinator: [Coordinator] = []
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        openHomeViewController()
    }
    
    func openHomeViewController() {
        let viewModel = HomeViewModel()
        viewModel.coordinator = self
        let viewController = HomeViewController(viewModel: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {

}
