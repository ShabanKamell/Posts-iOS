//
// Created by mac on 2019-03-25.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RxRequester

public protocol ViewModelProtocol: Reportable, ActivityIndicatable, Alertable {
    var rxRequester: RxRequester! { get set }
}

