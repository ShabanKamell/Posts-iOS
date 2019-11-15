//
//  PostDetail.swift
//  Dependencies
//
//  Created by mac on 11/12/19.
//  Copyright © 2019 sha. All rights reserved.
//

import UIKit
import Data

public protocol PostDetailModuleProtocol {
    func postDetailScreen(post: Post) -> UIViewController
}

extension Dependencies {
    public var postDetailModule: PostDetailModuleProtocol {
         resolve(PostDetailModuleProtocol.self)!
    }
}
