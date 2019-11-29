//
// Created by mac on 2019-03-30.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public let postsRepository: PostsRepository = PostsRepository()

public class PostsRepository {

    public func all(pagingInfo: PagingInfo, onError: @escaping (Error) -> Void) -> Observable<[PostResponse]> {
         allLocal(pagingInfo: pagingInfo, onError: onError)
                .flatMap({ [unowned self] items -> Observable<[PostResponse]> in
                    if items.isEmpty {
                        return self.allRemote(pagingInfo: pagingInfo, onError: onError)
                    }
                    return Observable.just(items)
                })
    }

    private func allLocal(pagingInfo: PagingInfo, onError: @escaping (Error) -> Void) -> Observable<[PostResponse]> {
        PostEntity.items(pagingInfo: pagingInfo)
        .do(onError: { error in
            onError(error)
            print(error.localizedDescription)
        })
    }

    private func allRemote(pagingInfo: PagingInfo, onError: @escaping (Error) -> Void) -> Observable<[PostResponse]> {
        requestList(
                request: {
                    api.rx.request(.posts(pagingInfo))
                },
                showActivity: false,
                onError: onError)
                .do(onNext: { (items: [PostResponse]) in
                    PostEntity.saveItems(items: items)
                })
    }

    public func add(request: AddPostRequest) -> Observable<Success> {
        requestItem(request: {
            api.rx.request(.addPost(request.encode()))
        })
    }

    public func edit(request: EditPostRequest) -> Observable<Success> {
        requestItem(request: {
            api.rx.request(.editPost(request))
        })
    }

    public func delete(id: Int) -> Observable<Success> {
        requestItem(request: {
            api.rx.request(.deletePost(id))
        })
    }
}

