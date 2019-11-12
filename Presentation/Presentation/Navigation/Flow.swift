//
// Created by mac on 11/4/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit
/**
	Every child flow must implement Flow protocol
	- func start: Starts the flow process, it usually decides what is going to be presented
	- var services: Property that contains all the services that are being used in the app
	- var finish: Is a closure that notifies parent Flow that the child flow is finished.
	- var currentVC: Returns view controller that is currently being displayed
*/
public protocol Flow {
    func start()
    var root: RootViewController! { get set }
    var currentVC: UIViewController?  { get }
}

extension Flow {
    public var currentVC: UIViewController? {
        root?.viewControllers.last
    }
}
