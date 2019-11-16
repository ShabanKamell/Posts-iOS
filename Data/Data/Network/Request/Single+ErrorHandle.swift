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
         self.map({ response in
                    guard (200...299).contains(response.statusCode) else {
                        throw MoyaError.statusCode(response)
                    }
                    return response
                })
                .do(onError: { error in

                })
    }

}
