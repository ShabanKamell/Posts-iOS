//
// Created by mac on 2019-05-26.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation

extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options, timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) {
        self.init()
        self.formatOptions = formatOptions
        self.timeZone = timeZone
    }
}

extension Formatter {
    static let iso8601 = ISO8601DateFormatter()
}

extension Date {
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}

extension String {
    var iso8601: Date? {
        var date = self

        if self.count == 19, !self.contains(obj: "Z") {
            date.append("Z")
        }

        return Formatter.iso8601.date(from: date)
    }
}