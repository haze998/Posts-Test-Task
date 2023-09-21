//
//  HomeViewModel.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import Foundation

protocol HomeCoordinatorDelegate: AnyObject {
    func openDetailViewController(_ post: PostInfo)
}

class HomeViewModel {
    
    weak var coordinator: HomeCoordinatorDelegate?
    var postsArr: [PostInfo?] = []
    var currentSortOption: SortOption = .byTimestamp
    var currentSortDirection: SortDirection = .descending
    
    func fetchPosts(completion: @escaping() -> Void) {
        NetworkManager.shared.getPosts { [weak self] result in
            guard let self = self else { return }
            self.postsArr = result
            completion()
        }
    }
    
    func openDetailViewController(_ post: PostInfo) {
        coordinator?.openDetailViewController(post)
        print(post)
    }
}
