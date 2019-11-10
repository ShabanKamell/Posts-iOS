//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

public extension UITableView {

    func register(_ identifier: Identifier) {
        self.register(identifier.nib, forCellReuseIdentifier: identifier.rawValue)
    }

    func dequeueReusableCell<T: UITableViewCell>(
            withIdentifier identifier: Identifier,
            for indexPath: IndexPath
    ) -> T {
        let cell = self.dequeueReusableCell(
                withIdentifier: identifier.rawValue,
                for: indexPath
        ) as! T
        cell.layoutIfNeeded()
        return cell
    }

    // This function in order to work you should
    // declare the type of the cell
    // example:
    // let cell: SomeCell = tableView.configureCell(......
    // ans don't return the cell directly
    //   public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //   return tableView.configureCell(......
    //  }
    func configureCell<CELL: Configurable>(
            identifier: Identifier,
            indexPath: IndexPath,
            item: Any,
            tableView: UITableView,
            vm: Any,
            vc: BaseViewController
    ) -> CELL {

        let cell: CELL = dequeueReusableCell(
                withIdentifier: identifier,
                for: indexPath
        )
        cell.configure(
                item: item,
                vm: vm,
                vc: vc,
                tableView: tableView
        )

        return cell
    }
}
