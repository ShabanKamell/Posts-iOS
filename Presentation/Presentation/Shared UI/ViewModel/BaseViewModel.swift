//
// Created by mac on 2019-03-25.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RxRequester

open class BaseViewModel: Reportable, ActivityIndicatable, Alertable {

    public var requester: RxRequester!

    public init() {
        setupRequester()
    }

    private func setupRequester() {
        requester = RxRequester(presentable: self)
    }

    open func viewDidLoad() {

    }

}

extension BaseViewModel: Presentable {
    public func showError(error: String) {
        print("showError")
    }

    public func showLoading() {
        print("showLoading")
    }

    public func hideLoading() {
        print("hideLoading")
    }

    public func onHandleErrorFailed(throwable: Error) {
        print("onHandleErrorFailed")
    }

}

public protocol HasViewModel {
    associatedtype VM: BaseViewModel
    var item: VM? { get set}

}
