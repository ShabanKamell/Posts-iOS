//
// Created by mac on 2019-07-30.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

let hijriMonths: [String] = [
    "محرم",
    "صفر",
    "ربيع الأول",
    "بيع الثاني",
    "جمادي الأول",
    "جمادي الثاني",
    "رجب",
    "شعبان",
    "رمضان",
    "شوال",
    "ذو القعدة",
    "ذو الحجة"
]

class MonthPicker: ItemPicker<String> {
    private var months: [String] = []
    private var callback: ((String) -> Void)!

    override func create(
            list: [String] = hijriMonths,
            callback: @escaping (String) -> Void
    ) -> ItemPicker<String> {
        return super.create(list: list, callback: callback)
    }

}
