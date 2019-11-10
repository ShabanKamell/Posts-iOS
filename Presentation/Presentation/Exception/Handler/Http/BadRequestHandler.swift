//
// Created by mac on 2019-03-26.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import Data

struct BadRequestHandler: ErrorCodeHandler {
    var supportedErrors: [Int] = [400]

    func handle(error: MoyaError, info: RequestInfo) {
        showOriginalHttpErrorMessage(error: error)
    }

}
