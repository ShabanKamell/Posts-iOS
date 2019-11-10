//
// Created by mac on 2019-08-06.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import Foundation

extension Date {

    func format(dateFormat: String = "MM/dd/yyyy hh:mm a") -> String {
        return DateFormatterHelper.format(date: self, dateFormat: dateFormat)
    }

}