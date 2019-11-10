//
// Created by mac on 2019-03-30.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation

struct HttpItemContract<T: Decodable>: Decodable {
    var entity: T
}
