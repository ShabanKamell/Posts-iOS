//
// Created by mac on 2019-07-30.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit
import Core

class YearPicker: ItemPicker<String> {
    private var years: [Int] = []
    private var callback: ((String) -> Void)!

    func create(
            fromYear: Int = 1899,
            toYear: Int = Date().year(),
            callback: @escaping (String) -> Void
    ) -> ItemPicker<String> {
        return super.create(
                list: Array(fromYear...toYear).map { String($0)}.reversed(),
                callback: callback
        )
    }

}

