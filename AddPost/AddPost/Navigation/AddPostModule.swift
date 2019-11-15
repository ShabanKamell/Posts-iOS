//
// Created by mac on 11/12/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Dependencies
import Data

public class AddPostModule : AddPostModuleProtocol {

    public init() { }

    public func addPostScreen(onAddPost: @escaping () -> Void) -> UIViewController {
        AddPostBuilder.make(onAddPost: onAddPost)
    }

}
