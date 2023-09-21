//
//  DetailViewModel.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 21.09.2023.
//

import Foundation

class DetailViewModel {
    // MARK: - Properties
    var post: PostInfo?
    var detailPost: DetailPostInfo?
    
    // MARK: - Fetch Detail Post
    func fetchDetailPost(completion: @escaping() -> Void) {
        NetworkManager.shared.getDetaiPost(id: "\(post?.postId ?? 0)") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let post):
                self.detailPost = post
            case .failure(let error):
                print(error)
            }
            completion()
        }
    }
}
