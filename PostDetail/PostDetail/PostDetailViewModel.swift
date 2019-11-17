//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Data
import Presentation
import RxRequester

final class PostDetailViewModel: ViewModelProtocol {
    var post: Post!

    var rxRequester: RxRequester!

    init(rxRequester: RxRequester) {
        self.rxRequester = rxRequester
    }

}


