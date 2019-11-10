//
// Created by mac on 2019-05-31.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation

import UIKit

protocol ConfigurableCell {
    associatedtype DataType
    associatedtype VM
    func configure(
            item: DataType,
            vm: VM,
            vc: BaseViewController
    )
}


