//
// Created by mac on 2019-04-20.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation

struct HttpListContract<T: Decodable>: Decodable {
    var entityList: [T]
}
