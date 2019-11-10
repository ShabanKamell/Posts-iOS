//
//  AppDelegate.swift
//  App
//
//  Created by mac on 11/3/19.
//  Copyright © 2019 sha. All rights reserved.
//

import UIKit
import Home
import Presentation
import IQKeyboardManager
import Core

var appFlow: AppFlow!

@UIApplicationMain
class AppDelegate: CoreAppDelegate, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared().isEnabled = true
        self.window = UIWindow(frame: UIScreen.main.bounds)

        initFlow()
        return true
    }

    private func initFlow() {
        appFlow = AppFlow()
        appFlow.start()
        self.window = UIWindow()
        appFlow.root.window = window
        self.window?.rootViewController = appFlow.root
        self.window?.makeKeyAndVisible()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

