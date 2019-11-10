//
// Created by mac on 2019-03-26.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import RxSwift
import Moya

public typealias InlineHandle = ((Error) -> Bool)?

extension ObservableType where E == Response{

    func handleError(info: RequestInfo) -> Observable<E> {
        return self.map({ response in
                    guard (200...299).contains(response.statusCode) else {
                        throw MoyaError.statusCode(response)
                    }
                    return response
                })
                .do(onError: { error in
                    info.onError?(error)

                    if info.showActivityIndicator {
//                        rootViewController.showLoading(show: false);
                    }

                    if info.inlineHandle != nil && info.inlineHandle!(error){ return }

//                    errorProcessor.process(error: error, info: info)
                })
    }

}
