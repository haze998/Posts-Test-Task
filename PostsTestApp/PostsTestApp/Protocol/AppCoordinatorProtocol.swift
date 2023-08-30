//
//  AppCoordinatorProtocol.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    var window: UIWindow { get }
    func openHomeScene()
}
