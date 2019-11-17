//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import RxSwift
import Data
import Presentation
import RxRequester

final class PostDetailViewModel: ViewModelProtocol {
    var rxRequester: RxRequester!
    var post: Post!

    init(rxRequester: RxRequester) {
        self.rxRequester = rxRequester
    }

}


