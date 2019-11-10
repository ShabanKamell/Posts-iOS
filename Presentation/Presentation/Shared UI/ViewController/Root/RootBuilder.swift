//Copyright Hitchhiker© 2017. All rights reserved.

import UIKit

public struct RootBuilder {

   public  static func make() -> RootViewController {
        let vc = StoryboardScene.Root.initialScene.instantiate()
        vc.vm = RootVm()
        return vc
   }

}

