//
// Created by mac on 2019-04-01.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxRequester

public protocol ViewControllerProtocol:
        Presentable,
        Reportable,
        ActivityIndicatable,
        Alertable {
    associatedtype VM: ViewModelProtocol
    var vm: VM! { get set}
}

extension ViewControllerProtocol {

    public func showError(error: String) {
        show(error: error)
    }

    public func showLoading() {
        showLoading(show: true)
    }

    public func hideLoading() {
        showLoading(show: false)
    }

    public func onHandleErrorFailed(error: Error) {
        show(error: L10n.oopsSomethingWentWrong)
    }

}