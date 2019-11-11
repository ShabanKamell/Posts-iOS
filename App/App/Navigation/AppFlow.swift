//
// Created by mac on 11/4/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import UIKit
import Presentation
import Home

class AppFlow: Flow {
    var root: RootViewController!

    required init(root: RootViewController? = nil) {
        self.root = root
    }

    public func start() {
        self.presentRoot()
    }

    private func presentRoot() {
        root = RootBuilder.make()
        root.initialFlow =  HomeFlow(root: root)
    }

}

extension AppFlow: AppNavDelegate {

    func home() {

    }

    func addPost() {

    }

    func editPost() {

    }

    private func startNew(flow: Flow) {
        flow.start()
    }

}
