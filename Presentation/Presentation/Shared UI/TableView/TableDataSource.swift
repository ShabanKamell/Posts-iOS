import UIKit

final class TableDataSource<CELL: Configurable, T, VM> : NSObject, UITableViewDataSource {

    var list: [T]
    private let identifier: Identifier
    private let vc: BaseViewController!
    private let vm: VM!

    init(
            identifier: Identifier,
            list: [T],
            vc: BaseViewController,
            vm: VM
    ) {
        self.list = list
        self.identifier = identifier
        self.vc = vc
        self.vm = vm
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.semanticContentAttribute = .forceRightToLeft
//        SemanticContentHelper.forceRtl()
        let cell: CELL = tableView.configureCell(
                identifier: identifier,
                indexPath: indexPath,
                item: list[indexPath.row],
                tableView: tableView,
                vm: vm,
                vc: vc
        )
        return cell
    }
}
