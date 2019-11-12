//
//  EditPost.swift
//  Dependencies
//
//  Created by mac on 11/12/19.
//  Copyright © 2019 sha. All rights reserved.
//

import UIKit

public protocol EditPostModuleProtocol {
    func editPostScreen() -> UIViewController
    func push() -> UIViewController
}

extension Dependencies {
    public var editPostModule: EditPostModuleProtocol {
         resolve(EditPostModuleProtocol.self)!
    }
}
