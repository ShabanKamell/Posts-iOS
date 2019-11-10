//
// Created by mac on 9/28/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct PagingInfo {
    var start: Int
    var limit: Int

   public init(start: Int, limit: Int = 30) {
        self.start = start
        self.limit = limit
    }
}
