//
// Created by mac on 2019-03-26.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import RxRequester
import RxSwift

struct UnauthorizedHandler: ResumableHandler {

    func handle<Element>(error: Error, presentable: Presentable?) -> Observable<Element> {
        Observable.just("")
    }

    func canHandle(error: Swift.Error) -> Bool {
        false
    }

    func handle(error: HTTPURLResponse, presentable: Presentable?) {

    }

}
