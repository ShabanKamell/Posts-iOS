//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import Presentation
import Data
import RxRequester

struct EditPostBuilder {

    static func make(post: Post, onUpdatePost: @escaping () -> Void) -> EditPostViewController {
        let vc = StoryboardScene.EditPost.initialScene.instantiate()

        let vm = EditPostViewModel(rxRequester: RxRequester(presentable: vc),
                postsRepository: PostsRepositoryBuilder.make())
        vm.post = post
        vc.vm = vm
        vc.onUpdatePost = onUpdatePost
        return vc
    }

}