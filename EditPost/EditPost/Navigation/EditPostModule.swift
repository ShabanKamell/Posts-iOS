//
// Created by mac on 11/12/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Dependencies
import Data

public class EditPostModule : EditPostModuleProtocol {

    public init() { }

    public func editPostScreen(post: Post, onUpdatePost: @escaping () -> Void) -> UIViewController {
        EditPostBuilder.make(post: post, onUpdatePost: onUpdatePost)
    }

}
