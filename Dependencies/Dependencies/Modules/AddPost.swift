//
//  AddPost.swift
//  Dependencies
//
//  Created by mac on 11/12/19.
//  Copyright © 2019 sha. All rights reserved.
//

import UIKit

public protocol AddPostModuleProtocol {
    func addPostScreen(onAddPost: @escaping () -> Void) -> UIViewController
}

extension Dependencies {
    public var addPostModule: AddPostModuleProtocol {
         resolve(AddPostModuleProtocol.self)!
    }
}
