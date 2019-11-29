//
// Created by mac on 2019-03-30.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public struct PostsRepository {
    private let remoteDataSource: PostsRemoteDataSource!
    private let localDataSource: PostsLocalDataSource!

    public init(remoteDataSource: PostsRemoteDataSource, localDataSource: PostsLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    public func all(pagingInfo: PagingInfo) -> Single<[PostResponse]> {
        remoteDataSource.all(pagingInfo: pagingInfo)
                .catchError({ error in
                    self.localDataSource.all(pagingInfo: pagingInfo)
                })
    }

    public func add(request: AddPostRequest) -> Single<Success> {
        remoteDataSource.add(request: request)
                .flatMap({  _ in self.localDataSource.add(request: request) })
    }

    public func edit(request: EditPostRequest) -> Single<Success> {
        remoteDataSource.edit(request: request)
                .flatMap({ _ in self.localDataSource.edit(request: request) })
    }

    public func delete(id: Int) -> Single<Success> {
        remoteDataSource.delete(id: id)
                .flatMap({ _ in self.localDataSource.delete(id: id) })
    }
}

