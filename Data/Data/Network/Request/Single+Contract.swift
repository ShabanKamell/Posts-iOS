//
// Created by mac on 2019-03-30.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import RxSwift
import Moya

extension ObservableType where E == Response {

    func mapResponseItem<T: Decodable>() -> Observable<T> {
        return  filterSuccessfulStatusCodes()
                .map(HttpItemContract<T>.self)
                .map({response in
                    response.entity
                })
    }

    func mapResponseList<T: Decodable>() -> Observable<[T]> {
        return  map(HttpListContract<T>.self, failsOnEmptyData: false)
                .map({response in
                    response.entityList
                })
    }

}
