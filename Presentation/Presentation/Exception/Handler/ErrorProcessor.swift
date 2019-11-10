//
// Created by mac on 2019-03-26.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import Data
import Core

let errorProcessor = ErrorProcessor()

class ErrorProcessor {

    private let httpErrorHandlers: Array<ErrorCodeHandler> = [
        BadRequestHandler(),
        UnauthorizedHandler()
    ]
   private let nsErrorHandlers: Array<NSErrorHandler> = [
       TimeoutHandler(),
       ConnectivityHandler()
    ]
    private let nonHttpErrorHandlers: Array<NonHttpErrorHandler> = []

    func process(error: Error, info: RequestInfo){
        do {

            switch error as! MoyaError {

            case .statusCode:
                handle(httpError: error as! MoyaError, info: info)

            case .underlying(let error, _):

                handle(nsError: error as NSError, info: info)

            case .imageMapping,
                 .jsonMapping,
                 .stringMapping,
                 .objectMapping,
                 .encodableMapping,
                 .requestMapping,
                 .parameterEncoding:
                genericError(error: error)
            }

        }
        catch let err {
            genericError(error: err)
        }
    }

    private func handle(httpError: MoyaError, info: RequestInfo) {
        let handler: ErrorCodeHandler? = httpErrorHandlers.first(where: {
            $0.canHandle(error: httpError)
        })
        guard  handler != nil else {
            genericError(error: httpError)
            return
        }
        handler!.handle(error: httpError, info: info)
    }

    private func handle(nonHttpError: Error, info: RequestInfo) {
        var handler: NonHttpErrorHandler? = nonHttpErrorHandlers.first(where: {
            $0.canHandle(error: nonHttpError)
        })

        guard handler != nil else {
            genericError(error: nonHttpError)
            return
        }

        handler!.handle(error: nonHttpError, info: info)
    }

    private func handle(nsError: NSError, info: RequestInfo) {
        if nsError.domain != NSURLErrorDomain {
            genericError(error: nsError)
            return
        }

        var handler: NSErrorHandler? = nsErrorHandlers.first(where: {
            $0.canHandle(error: nsError)
        })

        guard handler != nil else {
            genericError(error: nsError)
            return
        }

        handler!.handle(error: nsError, info: info)
    }

}

func genericError(error: Error) {
    CrashlyticsUtil.record(error: error)
    rootViewController.showError(message: L10n.oopsSomethingWentWrong)
}




