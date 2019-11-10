//
// Created by mac on 2019-05-31.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

public protocol Configurable where Self: UITableViewCell {
    func configure(
            item: Any,
            vm: Any,
            vc: BaseViewController,
            tableView: UITableView
    )
}

open class BaseCell<ITEM, VM>: UITableViewCell, Configurable {
   public var item: ITEM!
   public var vm: VM!
   public var vc: BaseViewController!
   public var tableView: UITableView!

    public func configure(
            item: Any,
            vm: Any,
            vc: BaseViewController,
            tableView: UITableView
    ){
        self.item = item as! ITEM
        self.vc = vc
        self.vm = vm as! VM
        self.tableView = tableView
        setup()
    }

    // Designed to be overridden
    open func setup(){

    }
}

// MARK: utils
public extension BaseCell {

    var indexPath: IndexPath {
        return tableView.indexPath(for: self)!
    }

    func reloadCell(with animation: UITableView.RowAnimation = .automatic){
        tableView.reloadRows(at: [indexPath], with: animation)
    }

    func deleteRow(with animation: UITableView.RowAnimation = .automatic){
        tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
    }

}
