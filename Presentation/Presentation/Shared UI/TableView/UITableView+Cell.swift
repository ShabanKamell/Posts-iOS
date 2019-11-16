//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

public extension UITableView {

    func register(_ identifier: Identifier, bundle: Bundle) {
        self.register(identifier.nib(bundle: bundle), forCellReuseIdentifier: identifier.rawValue)
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

    func configureCell<CELL: Configurable>(
            identifier: Identifier,
            indexPath: IndexPath,
            item: Any,
            delegate: ConfigurableCellDelegate) -> CELL {
        let cell: CELL = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.configure(item: item, delegate: delegate)
        return cell
    }
}
