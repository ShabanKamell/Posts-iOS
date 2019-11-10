//
// Created by mac on 2019-03-25.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import RxSwift
import Moya

open class BaseViewModel:
        Reportable,
        ActivityIndicatable,
        Alertable {

    public init() {
        
    }
    
    open func viewDidLoad() {

    }

}

public protocol HasViewModel {
    associatedtype VM: BaseViewModel
    var item: VM? { get set}

}
