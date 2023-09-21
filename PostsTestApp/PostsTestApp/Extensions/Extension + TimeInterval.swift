//
//  Extension + TimeInterval.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import Foundation

extension TimeInterval {
     func convertToDays() -> Int {
        let date = Date(timeIntervalSince1970: self)
        let currentDate = Date()
        let timeDifference = currentDate.timeIntervalSince(date)
        let daysAgo = Int(timeDifference / (60 * 60 * 24))
        return daysAgo
    }
    
    func convertTimeIntervalToFormattedDate(timeInterval: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let date = Date(timeIntervalSince1970: timeInterval)
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
