//
// Created by mac on 2019-05-27.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import Data

struct TimeoutHandler: NSErrorHandler {
    var supportedErrors: [Int] = [
         NSURLErrorTimedOut
    ]

    func handle(error: NSError, info: RequestInfo) {
        rootViewController.showError(message: L10n.connectionTooSlow)
    }

}
