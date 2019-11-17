//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Data
import Presentation
import RxRequester

final class PostsViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!

    init(rxRequester: RxRequester) {
         self.rxRequester = rxRequester
    }

    public func posts(pagingInfo: PagingInfo, onError: @escaping (Error) -> Void) -> Observable<[Post]> {
        rxRequester.request {
             postsRepository.all(pagingInfo: pagingInfo, onError: onError)
                     .map { $0.toPresent() }
        }
    }

    public func delete(id: Int) -> Observable<Success> {
         postsRepository.delete(id: id)
    }

}


