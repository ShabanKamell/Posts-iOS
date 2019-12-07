//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Data
import Presentation
import RxRequester
import ModelsMapper

struct PostsViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!
    private let postsRepository: PostsRepository!

    init(rxRequester: RxRequester, postsRepository: PostsRepository) {
        self.rxRequester = rxRequester
        self.postsRepository = postsRepository
    }

    public func posts(pagingInfo: PagingInfo) -> Single<[Post]> {
        rxRequester.request {
            self.postsRepository.all(pagingInfo: pagingInfo)
                    .map { ListMapper(PostMapper()).map($0) }
        }
    }

    public func delete(id: Int) -> Single<Success> {
         postsRepository.delete(id: id)
    }

}


