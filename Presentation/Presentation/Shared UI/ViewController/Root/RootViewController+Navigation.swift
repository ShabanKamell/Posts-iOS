//
// Created by mac on 2019-03-18.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

public extension RootViewController {

//    func navigateToPosts(){
//        navigate(vc: PostsBuilder.make())
//    }
//
//    func navigateToPostDetail(post: Post){
//        navigate(vc: PostDetailBuilder.make(post: post))
//    }
//
//    func navigateToAddPost(onAddPost: @escaping () -> Void){
//        navigate(vc: AddPostBuilder.make(onAddPost: onAddPost))
//    }
//
//    func navigateToEditPost(post: Post, onUpdatePost: @escaping () -> Void){
//        navigate(vc: EditPostBuilder.make(post: post, onUpdatePost: onUpdatePost))
//    }
}

public extension RootViewController {
    enum NavigationType {
        case push
        case add
        case present
    }

    func navigate(vc: UIViewController, type: NavigationType, animated: Bool = true) {

        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical

        switch type {
        case .push:
            pushViewController(vc, animated: animated)
        case .add:
            addChild(vc)
        case .present:
            present(vc, animated: animated)

        }
        vc.view.frame = view.safeAreaLayoutGuide.layoutFrame
        view.addSubview(vc.view)

        current?.willMove(toParent: nil)
        current?.viewWillDisappear(true)

        vc.didMove(toParent: self)
        vc.viewWillAppear(true)

        current = vc
    }
}
