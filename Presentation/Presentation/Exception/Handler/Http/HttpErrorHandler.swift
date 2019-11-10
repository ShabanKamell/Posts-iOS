//
// Created by mac on 2019-03-26.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import Data
import Core

protocol ErrorCodeHandler {
    var supportedErrors: [Int] { get set }
    func canHandle(error: MoyaError) -> Bool
    func handle(error: MoyaError, info: RequestInfo)
}

extension ErrorCodeHandler {

    func canHandle(error: MoyaError) -> Bool {
       let handler = supportedErrors.first(where: {
             $0 == error.response!.statusCode
        })
        return handler != nil
    }
}

func showOriginalHttpErrorMessage(error: MoyaError) {
    do {
        let response = error.response

        if response == nil {
            genericError(error: error)
            return
        }

        let body = try? response!.mapJSON()

        if body == nil {
            genericError(error: error)
            return
        }

        let data = serializeToData(jsonObject: body!)

        if data == nil {
            genericError(error: error)
            return
        }

        let httpErrorContract = try? JSONDecoder().decode(HttpErrorContract.self, from: data!)

        if httpErrorContract == nil {
            genericError(error: error)
            return
        }

        rootViewController.showError(message: httpErrorContract?.message)

    } catch let err{
        genericError(error: err)
    }
}
