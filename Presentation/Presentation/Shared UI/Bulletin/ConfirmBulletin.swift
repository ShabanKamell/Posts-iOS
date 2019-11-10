//
// Created by mac on 2019-05-31.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import BLTNBoard

typealias ConfirmHandler = ((BLTNActionItem) -> Void)
typealias CancelHandler = ((BLTNActionItem) -> Void)?

class ConfirmBulletin: NSObject {
    var presentingVC: UIViewController!

    var confirmHandler: ConfirmHandler
    var cancelHandler: CancelHandler
    var message: String

    lazy var bulletinManager: BLTNItemManager = {
        return BLTNItemManager(rootItem: createPage())
    }()

    init(
            vc: UIViewController,
            message: String,
            confirmHandler: @escaping ConfirmHandler,
            cancelHandler: CancelHandler = nil
            ) {
        self.message = message
        self.confirmHandler = confirmHandler
        self.cancelHandler = cancelHandler
        self.presentingVC = vc
    }

    func show() {
        retainMe()
        bulletinManager.showBulletin(above: presentingVC)
    }

    func createPage() -> BLTNPageItem {
        let page = ConfirmBulletinItem(title: L10n.confirmation)

        page.isDismissable = false
        page.descriptionText = message
        page.actionButtonTitle = L10n.proceed
        page.alternativeButtonTitle = L10n.cancel

        page.appearance.actionButtonColor = Asset.Colors.green.color
        page.appearance.alternativeButtonTitleColor = Asset.Colors.green.color

        page.actionHandler = { [weak self] item in
            self?.bulletinManager.dismissBulletin()
            self?.confirmHandler(item)
        }
        page.alternativeHandler = { [weak self] item in
            self?.bulletinManager.dismissBulletin()
            self?.cancelHandler?(item)
        }
        page.dismissalHandler = { [weak self] item in
            self?.releaseMe()
        }
        return page
    }
}