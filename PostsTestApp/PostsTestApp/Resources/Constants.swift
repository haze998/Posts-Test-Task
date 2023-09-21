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
    case detailPostURL = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/"
    case json = ".json"
}

// MARK: - Custom Names
enum ConstNames: String {
    case daysAgo = "days ago"
}

// MARK: - Custom Font
enum FontNames: String {
    case sfLight = "SFProText-Light"
    case sfRegular = "SFProText-Regular"
    case sfBold = "SFProText-Bold"
}

// MARK: - Image Const
enum ImageNames: String {
    case settings = "settings"
    case heart = "heart.fill"
}

// MARK: - Sorting enum const
enum SortOption {
    case byTimestamp
    case byLikesCount
}

// MARK: - Sort Direction
enum SortDirection {
    case ascending
    case descending
}
