//Copyright Hitchhiker© 2017. All rights reserved.

import Foundation
import RxRequester

public final class RootVm: ViewModelProtocol {
    public var rxRequester: RxRequester!

    public init(rxRequester: RxRequester) {
        self.rxRequester = rxRequester
    }

}
