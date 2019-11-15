//
// Created by mac on 11/14/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Dependencies

public extension UIViewController {

    func push(animated: Bool = true) {
        Dependencies.shared.rootViewController.push(vc: self, animated: animated)
    }

    func add(animated: Bool = true) {
        Dependencies.shared.rootViewController.push(vc: self, animated: animated)
    }

    func present(animated: Bool = true) {
        Dependencies.shared.rootViewController.present(vc: self, animated: animated)
    }
}