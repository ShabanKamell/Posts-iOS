//
// Created by mac on 9/25/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Presentation
import Data

final class AddPostViewController: BaseViewController {
    var vm: AddPostViewModel!
    var onAddPost: (() -> Void)!

    @IBOutlet weak var tfTitle: FormEntryTextField!
    @IBOutlet weak var tfBody: FormEntryTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.addPost
    }
    
}

// MARK: - Actions
extension AddPostViewController {

    @IBAction func addPost(_ sender: UIButton) {
        guard validateForm() else { return }

        let request = AddPostRequest(title: tfTitle.text!, body: tfBody.text!)
        vm.addPost(request: request)
                .subscribe(onNext: { [weak self] response in
                    rootViewController.popViewController(animated: false)
                    self?.onAddPost?()
                })
                .disposed(by: disposeBag)
    }

    private func validateForm() -> Bool {
        FormValidator.isValid(fields: [
            tfTitle.validate(),
            tfBody.validate()
        ])
    }
}

extension AddPostViewController: NavControllerContext {
    public func prefersNavBarHidden(navController: UINavigationController) -> Bool {
         false
    }

    func preferredBackButtonMode(navController: UINavigationController) -> BackButtonMode {
         .withoutText
    }
}


