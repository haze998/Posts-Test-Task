//
//  PostDetail.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 21.09.2023.
//

import Foundation

struct DetailPost: Decodable {
    let post: DetailPostInfo
}

struct DetailPostInfo: Decodable {
    let postId: Int
//    let timeshamp: TimeInterval
    let timeshamp: Int
    let title, text: String
    let postImage: String
    let likesCount: Int
}
