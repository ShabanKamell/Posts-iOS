//
// Created by mac on 9/26/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import Data
import RxRequester

struct PostDetailBuilder {

    static func make(post: Post) -> PostDetailViewController {
        let vc = StoryboardScene.PostDetail.initialScene.instantiate()
        let vm = PostDetailViewModel(rxRequester: RxRequester(presentable: vc))
        vm.post = post
        vc.vm = vm
        return vc
    }

}
