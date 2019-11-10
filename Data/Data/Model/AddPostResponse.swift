//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct AddPostResponse: Encodable, Decodable {
    let id: Int
    let title: String
    let body: String
}
