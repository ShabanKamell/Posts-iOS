//
// Created by mac on 2019-05-27.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Data

protocol NSErrorHandler {
    var supportedErrors: [Int] { get set }
    func canHandle(error: NSError) -> Bool
    mutating func handle(error: NSError, info: RequestInfo)
}

extension NSErrorHandler {
    func canHandle(error: NSError) -> Bool {
        let handler = supportedErrors.firstIndex(where: {
            $0 == error.code
        } )
        return handler != nil
    }
}
