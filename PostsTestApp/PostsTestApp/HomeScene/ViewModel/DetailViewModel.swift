//
//  DetailViewModel.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 21.09.2023.
//

import Foundation

class DetailViewModel {
    var post: PostInfo?
    var detailPost: DetailPostInfo?
    
    func fetchDetailPost(completion: @escaping() -> Void) {
        NetworkManager.shared.getDetaiPost(id: "\(post?.postId ?? 0)") { post in
            self.detailPost = post
            completion()
        }
    }
}
