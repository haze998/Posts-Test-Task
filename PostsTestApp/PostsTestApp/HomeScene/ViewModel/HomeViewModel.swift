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
    // MARK: - Properties
    weak var coordinator: HomeCoordinatorDelegate?
    var postsArr: [PostInfo?] = []
    var currentSortOption: SortOption = .byTimestamp
    var currentSortDirection: SortDirection = .descending
    
    // MARK: - Fetch Posts
    func fetchPosts(completion: @escaping() -> Void) {
        NetworkManager.shared.getPosts { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let posts):
                self.postsArr = posts
            case .failure(let error):
                print(error)
            }
            completion()
        }
    }
    
    // MARK: - Open Detail VC
    func openDetailViewController(_ post: PostInfo) {
        coordinator?.openDetailViewController(post)
    }
}
