//
// Created by mac on 9/25/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data
import Presentation

final class PostDetailViewController: UIViewController, ViewControllerProtocol {
    var vm: PostDetailViewModel!
    var post: Post!

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblBody: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.details
        lblTitle.text = vm.post.title
        lblBody.text = vm.post.body
    }
    
}

extension PostDetailViewController: NavControllerContext {
    public func prefersNavBarHidden(navController: UINavigationController) -> Bool {
         false
    }

    func preferredBackButtonMode(navController: UINavigationController) -> BackButtonMode {
         .withoutText
    }
}


