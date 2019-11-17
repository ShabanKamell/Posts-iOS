//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Presentation
import Data
import RxRequester

final class EditPostViewModel: ViewModelProtocol {

    var post: Post!

    var rxRequester: RxRequester!

    init(rxRequester: RxRequester) {
        self.rxRequester = rxRequester
    }

    func editPost(request: EditPostRequest) -> Observable<Success> {
         postsRepository.edit(request: request)
    }

}


