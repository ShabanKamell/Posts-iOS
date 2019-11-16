//
// Created by mac on 2019-03-26.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import RxSwift

protocol ResumableHandler {
    func canHandle(error: Swift.Error) -> Bool
    func handle<Element>(error: Swift.Error, presentable: Presentable?) -> Observable<Element>
}