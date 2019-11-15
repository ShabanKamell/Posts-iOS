//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

struct AddPostBuilder {

    static func make(onAddPost: @escaping () -> Void) -> AddPostViewController {
        let vc = StoryboardScene.AddPost.initialScene.instantiate()
        let vm = AddPostViewModel()
        vc.vm = vm
        vc.onAddPost = onAddPost
        return vc
    }

}