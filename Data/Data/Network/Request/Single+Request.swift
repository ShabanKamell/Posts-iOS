//
// Created by mac on 2019-03-30.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public extension PrimitiveSequence where Trait == SingleTrait, Element == Response {

    func mapItem<T: Decodable>() -> Single<T> {
        map(T.self, failsOnEmptyData: false)
    }

    func mapList<T: Decodable>() -> Single<[T]> {
        map([T].self, failsOnEmptyData: false)
    }
}



