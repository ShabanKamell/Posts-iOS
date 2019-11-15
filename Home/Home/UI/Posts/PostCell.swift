//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit
import Presentation
import Data
import Dependencies

class PostCell: BaseCell<Post, PostsViewModel> {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ivMore: UIImageView!

    override func setup() {
        super.setup()
        ivMore.tap(target: self, action: #selector(didTapMore))
        contentView.tap(target: self, action: #selector(didTapCell))
        lblTitle.text = item.title
    }

    @objc
    func didTapMore() {
        let edit = UIAlertAction(title: L10n.edit, style: .default){ [weak self] alert -> Void in
            guard self != nil else { return }
            Dependencies.shared.editPostModule.editPostScreen(
                    post: self!.item!,
                    onUpdatePost: {
                        [weak self] in
                        guard self != nil else { return }
                        self?.tableView.reloadData()
                    }).push()
        }
        let delete = UIAlertAction(title: L10n.delete, style: .default){ [weak self] alert -> Void in
            self?.deletePost()
        }
        let cancel = UIAlertAction(title: L10n.cancel, style: .cancel)

        rootViewController.showActionSheet(
                title: nil,
                message: L10n.options,
                actions: [edit, delete, cancel]
        )
    }

    private func deletePost() {
        vm.delete(id: item.id)
                .subscribe(onNext: { [weak self] response in
                    guard self != nil else { return }
                    (self!.vc as! PostsViewController).list.remove(at: self!.indexPath.row)
                    self!.deleteRow()
                })
                .disposed(by: vc.disposeBag)
    }

    @objc
    func didTapCell() {
        Dependencies.shared.postDetailModule.postDetailScreen(post: item!).push()
    }

}
