//
// Created by mac on 2019-07-28.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

class ConfirmBulletinItem: FeedbackPageBLTNItem {

    override func onDisplay() {
        super.onDisplay()
        titleLabel.isHidden = true

        actionButton?.titleLabel?.font = UIFont.cairo
        alternativeButton?.titleLabel?.font = UIFont.cairo
        descriptionLabel?.font = UIFont.cairo



    }
}