//
// Created by mac on 2019-06-04.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation

enum DateFormatType {
    case iso8601
}

extension String {

    func formatDate(formatType: DateFormatType) -> String {
        return formatIso8601(formatType: formatType, dateStyle: .full)
    }

    func formatTime(formatType: DateFormatType) -> String {
        return formatIso8601(formatType: formatType, timeStyle: .full)
    }

    func formatIso8601(
            formatType: DateFormatType,
            dateStyle: DateFormatter.Style = .none,
            timeStyle: DateFormatter.Style = .none
    ) -> String {
        let date: Date?


        switch formatType {
        case .iso8601:
            date = self.iso8601
        }

        guard date != nil else { return "" }

        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = dateStyle

        dateFormatter.timeStyle = timeStyle


        return dateFormatter.string(from: date!)
    }

}
