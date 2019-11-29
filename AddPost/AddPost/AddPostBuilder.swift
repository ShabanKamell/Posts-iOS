//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import RxRequester
import Data

struct AddPostBuilder {

    static func make(onAddPost: @escaping () -> Void) -> AddPostViewController {
        let vc = StoryboardScene.AddPost.initialScene.instantiate()

        let vm = AddPostViewModel(rxRequester: RxRequester(presentable: vc),
                postsRepository: PostsRepositoryBuilder.make())
        vc.vm = vm
        vc.onAddPost = onAddPost
        return vc
    }

}