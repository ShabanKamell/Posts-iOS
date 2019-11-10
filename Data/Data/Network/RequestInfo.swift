//
// Created by mac on 2019-05-19.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation

typealias RetryCallback = () -> Void
public struct RequestInfo {
    var request:  NetworkRequest
    var inlineHandle: InlineHandle = nil
    var showActivityIndicator: Bool = true
    var retryCallback: RetryCallback
    var onError: ((Error) -> Void)?
}
