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
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        viewController.navigationItem.title = "Posts"
        navigationController.navigationBar.titleTextAttributes = textAttributes
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func openDetailViewController(_ post: PostInfo) {
        let viewModel = DetailViewModel()
        viewModel.post = post
        let viewController = DetailViewController(viewModel: viewModel)
        viewController.navigationItem.title = "Detail"
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
