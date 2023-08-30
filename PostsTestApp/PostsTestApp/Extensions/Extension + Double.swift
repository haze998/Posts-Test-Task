//
//  Extension + Double.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import Foundation

extension Int {
    func convertTimestampToDate(timestamp: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = Date(timeIntervalSince1970: timestamp)
        return dateFormatter.string(from: date)
    }
}
