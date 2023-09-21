//
//  SceneDelegate.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinatorProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .light
        self.appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}

