//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

extension UITableView {

    func setup(
            source: UITableViewDataSource?,
            cellIdentifier: Identifier...
    ) {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 600
        dataSource = source
        cellIdentifier.forEach{ register($0) }

        separatorColor = UIColor.clear
        allowsSelection = false
        tableFooterView = UIView()
        tableHeaderView = nil

    }

}
