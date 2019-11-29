//
// Created by mac on 9/25/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Presentation
import Data
import RxSwift

final class EditPostViewController: UIViewController, ViewControllerProtocol {
    var vm: EditPostViewModel!
    var onUpdatePost: (() -> Void)!

    @IBOutlet weak var tfTitle: FormEntryTextField!
    @IBOutlet weak var tfBody: FormEntryTextField!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.editPost
        tfTitle.text = vm.post.title
        tfBody.text = vm.post.body
    }
}

// MARK: - Actions
extension EditPostViewController {

    @IBAction func editPost(_ sender: UIButton) {
        guard validateForm() else { return }

        vm.post.title = tfTitle.text!
        vm.post.body = tfBody.text!

        vm.editPost(request: EditPostRequest.from(post: vm.post))
                .subscribe(onSuccess: { [weak self] response in
                    rootViewController.popViewController(animated: false)
                    self?.onUpdatePost()
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

extension EditPostViewController: NavControllerContext {
    public func prefersNavBarHidden(navController: UINavigationController) -> Bool {
         false
    }

    func preferredBackButtonMode(navController: UINavigationController) -> BackButtonMode {
         .withoutText
    }
}


