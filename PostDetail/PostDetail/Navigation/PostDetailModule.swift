//
// Created by mac on 11/12/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Dependencies
import Data

public class PostDetailModule : PostDetailModuleProtocol {

    public init() { }

    public func postDetailScreen(post: Post) -> UIViewController {
        PostDetailBuilder.make(post: post)
    }

    public func push(post: Post) -> UIViewController {
        Dependencies.shared.rootViewController.push(vc: postDetailScreen(post: post))
    }
}
