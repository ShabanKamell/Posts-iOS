//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct PostResponse: Decodable {
    let id: Int
    let title: String
    let body: String

    func toPost() -> Post {
        return Post(
                id: id,
                title: title,
                body: body
        )
    }

    func toEntity() -> PostEntity {
        let entity = PostEntity()
        entity.id = Int64(id)
        entity.title = title
        entity.body = body
        return entity
    }

}

public extension Array where Element == PostResponse {
    func toPresent() -> [Post] {
        return self.map{ $0.toPost() }
    }
}
