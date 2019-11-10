//
// Created by mac on 2019-06-18.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation

public extension Date {

    func components(calendar: Calendar = Calendar.current) -> (year: Int, month: Int, day: Int) {

        let year = calendar.component(.year, from: self)
        let month =  calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)

        return (year: year, month: month, day: day)
    }

    func year(calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(.year, from: self)
    }


}
