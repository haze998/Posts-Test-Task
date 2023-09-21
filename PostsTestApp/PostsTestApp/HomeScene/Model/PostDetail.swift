//
//  PostDetail.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 21.09.2023.
//

import Foundation

// MARK: - DetaiPost
struct DetailPost: Decodable {
    let post: DetailPostInfo
}

// MARK: - DetailPostInfo
struct DetailPostInfo: Decodable {
    let postId: Int
    let timeshamp: TimeInterval
    let title, text: String
    let postImage: String
    let likesCount: Int
}
