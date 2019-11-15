//
// Created by mac on 11/12/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit

public protocol RootViewControllerProtocol {
    func get() -> UIViewController
    func push(vc: UIViewController, animated: Bool)
    func add(vc: UIViewController, animated: Bool)
    func present(vc: UIViewController, animated: Bool)
}

extension Dependencies {
    public var rootViewController: RootViewControllerProtocol {
        resolve(RootViewControllerProtocol.self)!
    }
}