//
// Created by mac on 2019-04-01.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

open class BaseViewController:
        UIViewController,
        Reportable,
        ActivityIndicatable,
        Alertable {
    public let disposeBag: DisposeBag = DisposeBag()

    open override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    open func setup(){

    }
}
