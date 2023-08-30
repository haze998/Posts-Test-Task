//
//  Constants.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import Foundation

// MARK: - API'S URL
enum ConstURL: String {
    case postsURL = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
}

// MARK: - Custom Font
enum FontNames: String {
    case sfLight = "SFProText-Light"
    case sfRegular = "SFProText-Regular"
    case sfBold = "SFProText-Bold"
}

// MARK: - Image Const
enum ImageNames: String {
    case like = "heart"
    case settings = "settings"
}

// MARK: - Sorting enum const
enum SortOption {
    case byTimestamp
    case byLikesCount
}

enum SortDirection {
    case ascending
    case descending
}
