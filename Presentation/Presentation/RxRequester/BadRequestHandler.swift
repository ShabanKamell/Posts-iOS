//
// Created by mac on 2019-03-26.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import RxRequester
import Data

struct BadRequestHandler: ErrorCodeHandler {
    var supportedErrors: [Int] = [400]

    func handle(error: HTTPURLResponse, presentable: Presentable?) {

    }

}
