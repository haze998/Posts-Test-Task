//
//  HomeViewModel.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import Foundation

protocol HomeCoordinatorDelegate: AnyObject {
    
}

class HomeViewModel {
    weak var coordinator: HomeCoordinatorDelegate?
}
