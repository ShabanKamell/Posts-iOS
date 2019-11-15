//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Presentation
import Data

final class EditPostViewModel: BaseViewModel {

    var post: Post!

    func editPost(request: EditPostRequest) -> Observable<Success> {
         postsRepository.edit(request: request)
    }

}


