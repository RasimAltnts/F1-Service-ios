//
//  Extension.swift
//  F1Service
//
//  Created by Wishi on 24.11.2023.
//

import Foundation

/**
 This function change timezone for race
 */
extension String {
   func toDate() -> Date? {
       let isDate = self
       let dateFormatter = DateFormatter()
       dateFormatter.timeZone = TimeZone(identifier: "Europe/Istanbul")
       dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss'Z'"
       let date = dateFormatter.date(from: isDate)
       return date
    }
}

