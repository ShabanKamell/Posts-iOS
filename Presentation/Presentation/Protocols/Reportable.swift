//Copyright HitchHiker© 2017. All rights reserved.

import UIKit
import SwiftMessages
import Core

public protocol Reportable {

    func showSuccess(
            title: String?,
            message: String?,
            actionTitle: String?,
            actionBlock: (() -> Void)?
    )

    func showError(
            title: String?,
            message: String?,
            actionTitle: String?,
            actionBlock: (() -> Void)?
    )

    func showInfo(
            title: String?,
            message: String?,
            actionTitle: String?,
            actionBlock: (() -> Void)?
    )

    func show(error: Error, title: String)
    func show(error: String, title: String)

}

public extension Reportable {

    func showSuccess(
            title: String? = nil,
            message: String?,
            actionTitle: String? = nil,
            actionBlock: (() -> Void)? = nil
    ) {
        showSwiftMessage(
                title: title,
                message: message,
                layout: .tabView,
                theme: .success,
                feedbackType: .success
        )
    }

    func show(error: String, title: String = "") {
        UINotificationFeedbackGenerator().notificationOccurred(.error)

        let nsError = NSError (
                domain: "Internal client error",
                code: 100,
                userInfo: [NSLocalizedDescriptionKey: error]
        )

        CrashlyticsUtil.record(
                error: nsError,
                description: error,
                failure: error
        )

        showError(
                title: title,
                message: error
        )
    }

    func show(error: Error, title: String = "") {
       show(error: error.localizedDescription, title: title)
    }

    func showError(
            title: String? = nil,
            message: String?,
            actionTitle: String? = nil,
            actionBlock: (() -> Void)? = nil
    ) {
        CrashlyticsUtil.record(description: title, failure: message)

        //Handle strings from the backend with \\
        let filteredTitle =
                title?.replacingOccurrences(
                                of: "\\r", with: "\r")
                        .replacingOccurrences(of: "\\n", with: "\n")

        let filteredMessage = message?
                .replacingOccurrences(of: "\\r", with: "\r")
                .replacingOccurrences(of: "\\n", with: "\n")

        showSwiftMessage(
                title: filteredTitle,
                message: filteredMessage,
                actionTitle: actionTitle,
                actionBlock: actionBlock,
                layout: .tabView,
                theme: .error,
                feedbackType: .error
        )
    }

    func showInfo(
            title: String? = nil,
            message: String?,
            actionTitle: String? = nil,
            actionBlock: (() -> Void)? = nil
    ) {
        showSwiftMessage(
                title: title,
                message: message,
                actionTitle: actionTitle,
                actionBlock: actionBlock,
                layout: .tabView,
                theme: .warning,
                feedbackType: .warning
        )
    }
}

fileprivate func showSwiftMessage(
        title: String? = nil,
        message: String?,
        actionTitle: String? = nil,
        actionBlock: (() -> Void)? = nil,
        layout: MessageView.Layout,
        theme: Theme,
        feedbackType: UINotificationFeedbackGenerator.FeedbackType
) {
    DispatchQueue.main.async {

        UINotificationFeedbackGenerator().notificationOccurred(feedbackType)

        let view = MessageView.viewFromNib(layout: layout)
        view.configureTheme(theme)
        view.configureDropShadow()

        if actionTitle == nil { view.button?.isHidden = true }
        if title == nil { view.titleLabel?.isHidden = true }

        view.configureContent(
                title: title,
                body: message,
                iconImage: nil,
                iconText: nil,
                buttonImage: nil,
                buttonTitle: actionTitle
        ) { _ in
            SwiftMessages.hide()
            actionBlock?()
        }

        var config: SwiftMessages.Config {
            var config = SwiftMessages.Config.init()
            config.duration = .seconds(seconds: 6)
            config.ignoreDuplicates = true
            config.dimMode = .gray(interactive: true)
            return config
        }

        SwiftMessages.show(config: config, view: view)
    }
}
