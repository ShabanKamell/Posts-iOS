//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Presentation
import Data
import RxRequester

final class AddPostViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!
    private let postsRepository: PostsRepository!

    init(rxRequester: RxRequester, postsRepository: PostsRepository) {
        self.rxRequester = rxRequester
        self.postsRepository = postsRepository
    }

    func addPost(request: AddPostRequest) -> Single<Success> {
         postsRepository.add(request: request)
    }

}


