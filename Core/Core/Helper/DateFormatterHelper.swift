//
// Created by mac on 2019-08-06.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import Foundation

class DateFormatterHelper {
    static let mdy = "MM/dd/yyyy"

    static func format(date: Date, dateFormat: String = "MM/dd/yyyy hh:mm a") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
}