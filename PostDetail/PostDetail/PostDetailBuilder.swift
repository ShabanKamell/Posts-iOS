//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import Data

struct PostDetailBuilder {

    static func make(post: Post) -> PostDetailViewController {
        let vc = StoryboardScene.PostDetail.initialScene.instantiate()
        let vm = PostDetailViewModel()
        vm.post = post
        vc.vm = vm
        return vc
    }

}
