//
// Created by mac on 11/29/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public struct PostsLocalDataSource {

    func all(pagingInfo: PagingInfo) -> Single<[PostResponse]> {
        PostEntity.items(pagingInfo: pagingInfo)
    }

    func add(request: AddPostRequest) -> Single<Success> {
        Single.just(Success())
    }

    func edit(request: EditPostRequest) -> Single<Success> {
        Single.just(Success())
    }

    func delete(id: Int) -> Single<Success> {
        Single.just(Success())
    }
}
