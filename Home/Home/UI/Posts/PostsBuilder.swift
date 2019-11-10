//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit

struct PostsBuilder {

    static func make() -> PostsViewController {
        let vc = StoryboardScene.Posts.initialScene.instantiate()
        let vm = PostsViewModel()
        vc.vm = vm
        return vc
    }

}
