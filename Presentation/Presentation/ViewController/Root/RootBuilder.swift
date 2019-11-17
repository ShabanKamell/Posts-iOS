//Copyright Hitchhiker© 2017. All rights reserved.

import UIKit
import RxRequester

public struct RootBuilder {

   public  static func make() -> RootViewController {
        let vc = StoryboardScene.Root.initialScene.instantiate()
        vc.vm = RootVm(rxRequester: RxRequester(presentable: vc))
        return vc
   }

}

