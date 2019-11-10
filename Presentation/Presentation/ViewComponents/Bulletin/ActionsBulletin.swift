//Copyright HitchHiker© 2017. All rights reserved.

import Foundation
import BLTNBoard

@objc public final class ButtetinAction: NSObject {
    let title: String
    @objc let action: (() -> Void)?
    let type: UIAlertAction.Style

    init(title: String, type: UIAlertAction.Style, action: (() -> Void)? = nil) {
        self.title = title
        self.action = action
        self.type = type

        super.init()
    }
}

final class ActionsBulletin: NSObject, BLTNItem {
    weak var manager: BLTNItemManager?

    var requiresCloseButton: Bool = false
    var shouldStartWithActivityIndicator: Bool = false
    var shouldRespondToKeyboardChanges: Bool = true
    var isDismissable: Bool = true
    var dismissalHandler: ((BLTNItem) -> Void)?
    var next: BLTNItem?

    func willDisplay() {

    }

    fileprivate let title: String
    fileprivate let descriptionText: String
    fileprivate let image: UIImage

    fileprivate let actions: [ButtetinAction]

    init(title: String, image: UIImage, description: String, actions: [ButtetinAction]) {
        self.title = title
        self.image = image
        self.descriptionText = description
        self.actions = actions
    }

    @objc fileprivate func actionButtonPressed(_ sender: UITapGestureRecognizer) {
        guard let button = sender.view as? UIButton else { return }
        manager?.dismissBulletin()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.actions.filter { $0.title == button.titleLabel?.text }.first?.action?()
        }
    }

    func setUp() {
    }

    func onDisplay() {
    }

    func makeArrangedSubviews() -> [UIView] {
        let appearance = BLTNItemAppearance()
        appearance.actionButtonColor = .hiHitchHikerYellow
        appearance.actionButtonTitleColor = .white
        let interfaceFactory = BLTNInterfaceBuilder(appearance: appearance, item: self)

        var arrangedSubviews = [UIView]()

        // Title Label
        let titleLabel = interfaceFactory.makeTitleLabel()
        titleLabel.label.text = title
        arrangedSubviews.append(titleLabel)

        // Image View
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit

        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 128).isActive = true
        imageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 64).isActive = true

        arrangedSubviews.append(imageView)

        // Description Label
        let descriptionLabel = interfaceFactory.makeDescriptionLabel()
        descriptionLabel.text = descriptionText
        arrangedSubviews.append(descriptionLabel)

        [titleLabel.label, descriptionLabel].forEach {
            $0.adjustsFontSizeToFitWidth = true
            $0.minimumScaleFactor = 0.5
            $0.numberOfLines = 0
        }

        // Buttons Stack
        let buttonsStack = interfaceFactory.makeGroupStack()

        actions.forEach { action in
            let actionButton = interfaceFactory.makeActionButton(title: action.title)
            switch action.type {
            case .default:
                actionButton.button.setTitleColor(.white, for: .normal)
                actionButton.button.setBackgroundColor(color: .hiHitchHikerYellow, forState: .normal)
            case .destructive:
                actionButton.button.setTitleColor(.red, for: .normal)
                actionButton.button.setBackgroundColor(color: .clear, forState: .normal)
            case .cancel:
                actionButton.button.setTitleColor(.hhBlackColor, for: .normal)
                actionButton.button.setBackgroundColor(color: .clear, forState: .normal)
            }
            let tapAction = UITapGestureRecognizer(target: self, action: #selector(actionButtonPressed(_:)))
            actionButton.button.addGestureRecognizer(tapAction)
            buttonsStack.addArrangedSubview(actionButton)
        }

        arrangedSubviews.append(buttonsStack)

        return arrangedSubviews
    }

    func onDismiss() {
    }

    func tearDown() {
    }
}
