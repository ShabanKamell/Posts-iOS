//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Presentation
import Data
import RxRequester

final class EditPostViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!
    var post: Post!
    private let postsRepository: PostsRepository!

    init(rxRequester: RxRequester, postsRepository: PostsRepository) {
        self.rxRequester = rxRequester
        self.postsRepository = postsRepository
    }

    func editPost(request: EditPostRequest) -> Single<Success> {
        postsRepository.edit(request: request)
    }

}


