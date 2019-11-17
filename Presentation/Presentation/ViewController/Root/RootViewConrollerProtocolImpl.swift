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

    public func push(vc: UIViewController, animated: Bool = true) {
        rootViewController.navigate(vc: vc, type: .push, animated: animated)
    }

    public func add(vc: UIViewController, animated: Bool = true) {
        rootViewController.navigate(vc: vc, type: .add, animated: animated)
    }

    public func present(vc: UIViewController, animated: Bool = true) {
        rootViewController.navigate(vc: vc, type: .present, animated: animated)
    }
}