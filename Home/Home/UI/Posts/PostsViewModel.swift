//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Data
import Presentation

 class PostsViewModel: BaseViewModel {

   
    public func posts(pagingInfo: PagingInfo, onError: @escaping (Error) -> Void) -> Observable<[Post]> {
        PostsViewModel()
        return postsRepository.all(pagingInfo: pagingInfo, onError: onError)
                .map { $0.toPresent() }
    }

    public func delete(id: Int) -> Observable<Success> {
        return postsRepository.delete(id: id)
    }

}


