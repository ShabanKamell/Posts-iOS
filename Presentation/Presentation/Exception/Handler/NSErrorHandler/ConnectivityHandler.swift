//
// Created by mac on 2019-03-26.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import Data

struct ConnectivityHandler: NSErrorHandler {
    var supportedErrors: [Int] = [
        NSURLErrorNotConnectedToInternet,
        NSURLErrorCannotConnectToHost,
        NSURLErrorNetworkConnectionLost
    ]

    func handle(error: NSError, info: RequestInfo) {
        rootViewController.showError(message: L10n.networkOffline)
    }


}
