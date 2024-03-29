//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

public protocol ActivityIndicatable {
    var isLoading: Bool { get }
    func showLoading(show: Bool)
}

private let loadingViewTag = 4875618

public extension ActivityIndicatable {

    public var isLoading: Bool { rootViewController.view.viewWithTag(loadingViewTag) != nil }

    public func showLoading(show: Bool) {

        if show {
            let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
            effectView.tag = loadingViewTag

            let indicator = UIActivityIndicatorView(style: .gray)
            indicator.hidesWhenStopped = true
            indicator.startAnimating()
            effectView.contentView.addSubview(indicator)
            indicator.bindFrameToSuperviewBounds()

            effectView.frame = rootViewController.view.frame
            rootViewController.view.addSubview(effectView)
            effectView.bindFrameToSuperviewBounds()

            return
        }

        while let effectView = rootViewController.view.viewWithTag(loadingViewTag) {
            effectView.removeFromSuperview()
        }

    }

}
