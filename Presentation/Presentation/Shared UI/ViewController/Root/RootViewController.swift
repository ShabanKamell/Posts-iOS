//
// Created by Sha on 2019-02-16.
// Copyright (c) 2019 A. All rights reserved.
//
import UserNotifications
import UIKit

#if DEBUG
import FLEX
#endif

public var rootViewController: RootViewController!

public final class RootViewController:
        NavigationController,
        ActivityIndicatable,
        Reportable,
        Alertable {

    public var initialFlow: Flow!

    var current: UIViewController?
    var vm: RootVm!
    public var window: UIWindow!

    public override func viewDidLoad() {
        super.viewDidLoad()
        configureApp()
        initialFlow.start()
    }
}

// MARK: - Private methods
extension RootViewController {

    func configureApp() {
        #if DEBUG
        addFlexGesture()
        #endif
    }

    #if DEBUG
    fileprivate func addFlexGesture() {
        FLEXManager.shared().isNetworkDebuggingEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showFlexMenu))
        tapGestureRecognizer.numberOfTapsRequired = 10
        tapGestureRecognizer.numberOfTouchesRequired = 1
        window.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func showFlexMenu() {
        FLEXManager.shared().toggleExplorer()
    }
    #endif

}
