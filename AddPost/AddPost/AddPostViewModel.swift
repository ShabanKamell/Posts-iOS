//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Presentation
import Data
import RxRequester

final class AddPostViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!

    init(rxRequester: RxRequester) {
        self.rxRequester = rxRequester
    }
    func addPost(request: AddPostRequest) -> Observable<Success> {
         postsRepository.add(request: request)
    }

}


