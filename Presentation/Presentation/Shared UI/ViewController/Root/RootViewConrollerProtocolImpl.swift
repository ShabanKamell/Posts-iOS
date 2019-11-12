//
// Created by mac on 11/12/19.
// Copyright (c) 2019 sha. All rights reserved.
//


import UIKit
import Dependencies

extension RootViewController: RootViewControllerProtocol {

    public func get() -> UIViewController {
        rootViewController
    }

    public func push(vc: UIViewController) -> UIViewController {
        rootViewController.navigate(vc: vc)
        return vc
    }
}