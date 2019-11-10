//
// Created by mac on 9/25/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data
import Presentation

final class PostsViewController: BaseViewController {
    var vm: PostsViewModel!
    var list: [Post] = []
    
    @IBOutlet weak var tableView: PagedTableView!{
        didSet {
            tableView?.register(.postCell)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("tableView == nil \(tableView == nil)")
        tableView.paginatedDelegate = self
        tableView.paginatedDataSource = self
        tableView.loadItems()
    }
}

// MARK: - Actions
extension PostsViewController {

    @IBAction func addPost(_ sender: UIButton) {
//        rootViewController.navigateToAddPost() {
//            // on real life app, we can reload data
//            // or simply add the new post at the top of the list
//        }
    }

}

extension PostsViewController: PaginatedTableViewDelegate {

    func loadMore(start: Int, pageCount: Int, onSuccess: ((Int) -> Void)?, onError: ((Error) -> Void)?) {
        let pagingInfo = PagingInfo(start: start)
        vm.posts(pagingInfo: pagingInfo,
                        onError: { error in
                            onError?(error)
                        })
                .subscribe(onNext: { [weak self] response in
                    self?.list += response
                    onSuccess?(response.count)
                })
                .disposed(by: disposeBag)
    }

}

// MARK: Paginated Data Source
extension PostsViewController: PaginatedTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostCell = tableView.configureCell(
                identifier: .postCell,
                indexPath: indexPath,
                item: list[indexPath.row],
                tableView: tableView,
                vm: vm,
                vc: self
        )
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
         1
    }
}


