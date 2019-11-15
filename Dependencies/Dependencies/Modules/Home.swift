//
//  Home.swift
//  Dependencies
//
//  Created by mac on 11/12/19.
//  Copyright © 2019 sha. All rights reserved.
//

import UIKit

public protocol HomeModuleProtocol {
    func homeScreen() -> UIViewController
}

extension Dependencies {
    public var homeModule: HomeModuleProtocol {
        resolve(HomeModuleProtocol.self)!
    }
}
