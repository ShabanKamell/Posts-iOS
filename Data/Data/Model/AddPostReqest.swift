//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct AddPostRequest: Encodable, Decodable {
    let title: String
    let body: String

    public init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
