//
// Created by mac on 2019-03-25.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RxRequester

//open class BaseViewModel: , ViewModelProtocol {
//
//    public var requester: RxRequester!
//
//    public init() {
//        setupRequester()
//    }
//
//    private func setupRequester() {
//        requester = RxRequester(presentable: self)
//    }
//
//}

public protocol ViewModelProtocol: Reportable, ActivityIndicatable, Alertable {
    var rxRequester: RxRequester! { get set }
    init(rxRequester: RxRequester)
}

