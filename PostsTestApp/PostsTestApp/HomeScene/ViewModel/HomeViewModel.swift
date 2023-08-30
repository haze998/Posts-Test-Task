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
    
    private(set) var postsArr: [PostInfo] = []
    
    func fetchPosts(completion: @escaping() -> Void) {
        NetworkManager.shared.getPosts { [weak self] result in
            guard let self = self else { return }
            self.postsArr = result
            completion()
        }
    }
}
