//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Presentation
import Data

final class AddPostViewModel: BaseViewModel {

    func addPost(request: AddPostRequest) -> Observable<Success> {
         postsRepository.add(request: request)
    }

}


