//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct EditPostRequest: Encodable, Decodable {
    let id: Int
    let title: String
    let body: String

    static func from(post: Post) -> EditPostRequest {
        return EditPostRequest(
                id: post.id,
                title: post.title,
                body: post.body
        )
    }
}
