//
// Created by mac on 2019-05-31.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

public protocol ConfigurableCellDelegate {
    func cellTableView() -> UITableView
    func viewController() -> UIViewController
}

public protocol Configurable where Self: UITableViewCell {
    func configure(item: Any, delegate: ConfigurableCellDelegate)
}

open class ConfigurableCell<ITEM>: UITableViewCell, Configurable {
    public var item: ITEM!
    public var cellDelegate: ConfigurableCellDelegate!

    public func configure(item: Any, delegate: ConfigurableCellDelegate){
        self.item = item as! ITEM
        self.cellDelegate = delegate
        setup()
    }

    // Designed to be overridden
    open func setup(){}
}

// MARK: utils
public extension ConfigurableCell {

    var indexPath: IndexPath {
        cellDelegate.cellTableView().indexPath(for: self)!
    }

    func reloadCell(with animation: UITableView.RowAnimation = .automatic){
        cellDelegate.cellTableView().reloadRows(at: [indexPath], with: animation)
    }

    func deleteRow(with animation: UITableView.RowAnimation = .automatic){
        cellDelegate.cellTableView().deleteRows(at: [indexPath as IndexPath], with: .fade)
    }

}
