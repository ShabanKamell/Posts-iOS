//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct PostResponse: Decodable {
    let id: Int
    let title: String
    let body: String
}

public struct PostMapper: Mapper {
    public typealias I = PostResponse
    public typealias O = Post

    public init() {}

    public func map(_ input: PostResponse) -> Post {
        Post(id: input.id, title: input.title, body: input.body)
    }
}
