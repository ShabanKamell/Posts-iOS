//
// Created by mac on 11/29/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public struct PostsRemoteDataSource {

    func all(pagingInfo: PagingInfo) -> Single<[PostResponse]> {
        api.rx.request(.posts(pagingInfo))
                .mapList()
                .do(onSuccess: { items in PostEntity.saveItems(items: items)})
    }

    func add(request: AddPostRequest) -> Single<Success> {
        api.rx.request(.addPost(request.encode())).mapItem()
    }

    func edit(request: EditPostRequest) -> Single<Success> {
        api.rx.request(.editPost(request)).mapItem()
    }

    func delete(id: Int) -> Single<Success> {
        api.rx.request(.deletePost(id)).mapItem()
    }
}
