//
//  PostInfoModel.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import Foundation

// MARK: - Post info
struct PostInfo: Codable {
    let postId, timeshamp: Int?
    let title, previewText: String?
    let postImage: String?
    let likesCount: Int?
}
