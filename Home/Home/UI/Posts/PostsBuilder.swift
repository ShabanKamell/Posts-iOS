//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import RxRequester
import Data

struct PostsBuilder {

    static func make() -> PostsViewController {
        let vc = StoryboardScene.Posts.initialScene.instantiate()


        let vm = PostsViewModel(rxRequester: RxRequester(presentable: vc),
                postsRepository: PostsRepositoryBuilder.make())
        vc.vm = vm
        return vc
    }

}
