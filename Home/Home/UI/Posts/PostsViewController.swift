//
// Created by mac on 9/25/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
import Data
import Presentation
import Dependencies
import RxSwift

final class PostsViewController: UIViewController, ViewControllerProtocol {
    var vm: PostsViewModel!
    var list: [Post] = []
    private let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: PagedTableView!{
            didSet {
                tableView.register(.postCell, bundle: Bundle(for: type(of: self)))
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.paginatedDelegate = self
        tableView.paginatedDataSource = self
        tableView.loadItems()
    }
}

// MARK: - Actions
extension PostsViewController {

    @IBAction func addPost(_ sender: UIButton) {
        Dependencies.shared.addPostModule.addPostScreen {
//            // on real world app, we can reload data
//            // or simply add the new post at the top of the list
                }
                .push()
    }

}

extension PostsViewController: PaginatedTableViewDelegate {

    func loadMore(start: Int, pageCount: Int, onSuccess: ((Int) -> Void)?, onError: ((Error) -> Void)?) {
        let pagingInfo = PagingInfo(start: start)
        vm.posts(pagingInfo: pagingInfo, onError: { onError?($0) })
                .subscribe(onNext: { [weak self] response in
                    self?.list += response
                    onSuccess?(response.count)
                })
                .disposed(by: disposeBag)
    }

}

// MARK: Paginated Data Source
extension PostsViewController: PaginatedTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { list.count }
    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.configureCell(
                identifier: .postCell,
                indexPath: indexPath,
                item: list[indexPath.row],
                delegate: self
        ) as PostCell
        cell.delegate = self
        return cell
    }

}

extension PostsViewController: PostCellDelegate {
    func deletePost(post: Post, cell: ConfigurableCell<Post>) {
        vm.delete(id: post.id)
                .subscribe(onNext: { [weak self] response in
                    guard self != nil else { return }
                    self!.list.remove(at: cell.indexPath.row)
                    cell.deleteRow()
                })
                .disposed(by: disposeBag)
    }
}

extension PostsViewController: ConfigurableCellDelegate {
    public func cellTableView() -> UITableView {
        tableView
    }

//    func tableView(for cell: ConfigurableCell<Post>) -> UITableView { tableView }
    func viewController() -> UIViewController { self }
}


