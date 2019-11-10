//
// Created by mac on 11/4/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import UIKit
import Presentation

public class HomeFlow: Flow {
    public var root: RootViewController!

   public required init(root: RootViewController? = nil) {
        self.root = root
    }

    public func start() {
        root?.navigate(vc: PostsBuilder.make())
    }

}
