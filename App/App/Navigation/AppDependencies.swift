//
//  AppDependencies.swift
//  App
//
//  Created by mac on 11/12/19.
//  Copyright © 2019 sha. All rights reserved.
//

import UIKit
import Dependencies
import Home
import Presentation
import PostDetail


func setupDependencies() {
    // register dependencies here
    let dependencies = Dependencies.shared

    dependencies.register(RootViewControllerProtocol.self) {
        guard rootViewController == nil else { return rootViewController }
        rootViewController = RootViewController()
        return rootViewController
    }

    dependencies.register(HomeModuleProtocol.self) {
         HomeModule()
    }

    dependencies.register(PostDetailModuleProtocol.self) {
        PostDetailModule()
    }

}
