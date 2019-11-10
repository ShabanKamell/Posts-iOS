//
// Created by mac on 2019-03-30.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public typealias NetworkRequest = () -> Single<Response>

public func requestItem<T: Decodable>(
        request: @escaping NetworkRequest,
        inlineHandle: InlineHandle = nil,
        showActivity indicator: Bool = true,
        onError: ((Error) -> Void)? = nil
) -> Observable<T> {
    let ps = PublishSubject<Response>()

    defer {
        doRequest(
                request: request,
                ps: ps,
                inlineHandle: inlineHandle,
                showActivity: indicator
        )
    }
    return ps.map(T.self, failsOnEmptyData: false)
}

public func requestList<T: Decodable>(
        request: @escaping NetworkRequest,
        inlineHandle: InlineHandle = nil,
        showActivity indicator: Bool = true,
        onError: ((Error) -> Void)? = nil
) -> Observable<[T]> {
    let ps = PublishSubject<Response>()

    defer {
        doRequest(
                request: request,
                ps: ps,
                inlineHandle: inlineHandle,
                showActivity: indicator
        )
    }
    return ps.map([T].self, failsOnEmptyData: false)
}

public func doRequest(
        request: @escaping NetworkRequest,
        ps: PublishSubject<Response>,
        inlineHandle: InlineHandle = nil,
        showActivity indicator: Bool = true,
        onError: ((Error) -> Void)? = nil
) {
    let observable: Observable<Response> = request()
            .asObservable()
            .handleError(info: RequestInfo(
                    request: request,
                    inlineHandle: inlineHandle,
                    showActivityIndicator: indicator,
                    retryCallback: { doRequest(
                            request: request,
                            ps: ps,
                            inlineHandle:
                            inlineHandle,
                            showActivity: indicator
                    ) },
                    onError: onError))
            .do(onSubscribe: {
                if indicator {
//                    rootViewController.showLoading(show: true);
                }
            })
            .do(onCompleted: {
                if indicator {
//                    rootViewController.showLoading(show: false);
                }
            })

    _ = observable.subscribe(onNext: { response in
        ps.onNext(response)
        ps.onCompleted()
    })
}


