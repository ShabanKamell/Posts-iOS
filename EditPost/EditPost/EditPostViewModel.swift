//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Presentation
import Data
import RxRequester

final class EditPostViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!
    var post: Post!

    init(rxRequester: RxRequester) {
        self.rxRequester = rxRequester
    }

    func editPost(request: EditPostRequest) -> Observable<Success> {
         postsRepository.edit(request: request)
    }

}


