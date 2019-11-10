//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

enum FormEntryImageViewMode: Int {
    case none = 0
    case left = 1
    case right = 2
}

enum VerticalEntryPosition: Int {
    case alone = 0
    case top = 1
    case middle = 2
    case bottom = 3
}

enum HorizontalEntryPosition: Int {
    case alone = 0
    case left = 1
    case middle = 2
    case right = 3
}

@IBDesignable
final class FormEntryTextField: FloatingLabelTextField {
    @IBInspectable var defaultStyle: Bool = true
    @IBInspectable var iconImage: UIImage?
    @IBInspectable var imageViewMode: Int = FormEntryImageViewMode.left.rawValue
    @IBInspectable var verticalEntryPosition: Int = VerticalEntryPosition.alone.rawValue { didSet { modifyAppearance() } }
    @IBInspectable var horizontalEntryPosition: Int = HorizontalEntryPosition.alone.rawValue { didSet { modifyAppearance() } }
    @IBInspectable var rightContentInset: CGFloat = 0

    fileprivate var imageViewModeEnum: FormEntryImageViewMode {
        return FormEntryImageViewMode(rawValue: imageViewMode) ?? .none
    }

    fileprivate var horizontalEntryPositionEnum: HorizontalEntryPosition {
        return HorizontalEntryPosition(rawValue: horizontalEntryPosition) ?? .alone
    }

    fileprivate var verticalEntryPositionEnum: VerticalEntryPosition {
        return VerticalEntryPosition(rawValue: verticalEntryPosition) ?? .alone
    }

    fileprivate var padding: UIEdgeInsets {
        if effectiveUserInterfaceLayoutDirection == .leftToRight {
            let rightInset = frame.width - (rightView?.frame.minX ?? (frame.width - 8)) + rightContentInset
            return UIEdgeInsets(top: 0, left: (leftView?.frame.maxX ?? 8), bottom: 0, right: rightInset)
        } else {
            let rightInset = frame.width - (leftView?.frame.minX ?? (frame.width - 8))
            return UIEdgeInsets(top: 0, left: (rightView?.frame.maxX ?? 8) + rightContentInset, bottom: 0, right: rightInset)
        }
    }
    fileprivate var separators = [UIView]()
    override var placeholder: String? {
        didSet {
            attributedPlaceholder = NSAttributedString(string:placeholder ?? "",
                    attributes: [.foregroundColor: UIColor.hiHint,
                                 .font : UIFont.cairo])
        }
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let textBounds = textRect(forBounds: bounds)
        let iconWidth: CGFloat = 16
        if effectiveUserInterfaceLayoutDirection == .rightToLeft {
            let newBounds = CGRect(
                    x: textBounds.maxX - iconWidth,
                    y: 0,
                    width: iconWidth,
                    height: bounds.height
            )
            return newBounds.inset(by: .zero)
        } else {
            let newBounds = CGRect(
                    x: textBounds.minX,
                    y: 0,
                    width: iconWidth,
                    height: bounds.height
            )
            return newBounds.inset(by: .zero)
        }
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        modifyAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modifyAppearance()
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        modifyAppearance()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setCorners(
                verticalEntryPosition: verticalEntryPositionEnum,
                horizontalEntryPosition: horizontalEntryPositionEnum
        )
    }

    private func modifyAppearance() {
        guard let imageViewMode = FormEntryImageViewMode(rawValue: imageViewMode),
              let verticalEntryPosition = VerticalEntryPosition(rawValue: verticalEntryPosition),
              let horizontalEntryPosition = HorizontalEntryPosition(rawValue: horizontalEntryPosition) else {
            fatalError("Check your values for the IBDesignable FormEntryTextField")
        }

        if textAlignment != .center {
            textAlignment = effectiveUserInterfaceLayoutDirection == .rightToLeft ? .right : .left
        }
        font = .defaultFontMedium14
        borderStyle = .none
        backgroundColor = backgroundColor ?? .hhFormFieldBackground
        tintColor = tintColor ?? Asset.Colors.yellow.color
        setIcons(imageViewMode)
        setCorners(verticalEntryPosition: verticalEntryPosition, horizontalEntryPosition: horizontalEntryPosition)
        addSeparatorIfNeeded(verticalEntryPosition: verticalEntryPosition, horizontalEntryPosition: horizontalEntryPosition)
    }
}

// MARK: - Private methods
extension FormEntryTextField {
    fileprivate func setIcons(_ imageViewMode: FormEntryImageViewMode) {

        guard let iconImage = iconImage else { return }

        let imageView = UIImageView(image: iconImage)
        imageView.contentMode = .scaleAspectFit

        let containerView = UIView(
                frame: CGRect(
                        x: 0,
                        y: 0,
                        width: 32,
                        height: intrinsicContentSize.height
                )
        )
        containerView.addSubview(imageView)

        switch imageViewMode {
        case .left:
            leftView = containerView
            leftViewMode = .always
        case .right:
            rightView = containerView
            rightViewMode = .always
        default: break
        }
        imageView.bindFrameToSuperviewBounds(insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
    }

    fileprivate func setCorners(
            verticalEntryPosition: VerticalEntryPosition,
            horizontalEntryPosition: HorizontalEntryPosition) {
        guard defaultStyle else { return }

        var roundingCorners: UIRectCorner = [
            .bottomLeft,
            .bottomRight,
            .topLeft,
            .topRight
        ]

        switch verticalEntryPosition {
        case .alone: break
        case .top: roundingCorners = [.topLeft, .topRight]
        case .middle: roundingCorners = []
        case .bottom: roundingCorners = [.bottomRight, .bottomLeft]
        }
        switch horizontalEntryPosition {
        case .alone: break
        case .left: roundingCorners.remove([.topRight, .bottomRight])
        case .middle: roundingCorners.remove([.allCorners])
        case .right: roundingCorners.remove([.topLeft, .bottomLeft])
        }

//        cornerRadius = floor((frame.height / 2) - 1)
        cornerRadius = 10

        borderWidth = 0.3
        borderColor = Asset.Colors.green.color
//        borderColor = UIColor.clear
        backgroundColor = UIColor.white

    }

    fileprivate func addSeparatorIfNeeded(
            verticalEntryPosition: VerticalEntryPosition,
            horizontalEntryPosition: HorizontalEntryPosition
    ) {
        separators.forEach { $0.removeFromSuperview() }
        separators.removeAll()
        switch verticalEntryPosition {
        case .top, .middle:
            addBottomSeparator()
        default: break
        }
        switch horizontalEntryPosition {
        case .left, .middle:
            addRightSeparator()
        default: break
        }
    }

    fileprivate func addBottomSeparator() {
        let bottomSeparator = UIView()
        bottomSeparator.backgroundColor = .hhFormFieldSeparator
        addSubview(bottomSeparator)
        bottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:[bottomSeparator(1)]|",
                options: [],
                metrics: nil,
                views: ["bottomSeparator": bottomSeparator])
        )
        addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-8-[bottomSeparator]-8-|",
                options: [],
                metrics: nil,
                views: ["bottomSeparator": bottomSeparator])
        )
    }

    func addRightSeparator() {
        let rightSeparator = UIView()
        rightSeparator.backgroundColor = .hhFormFieldSeparator
        addSubview(rightSeparator)
        rightSeparator.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "H:[rightSeparator(2)]|",
                options: [],
                metrics: nil,
                views: ["rightSeparator": rightSeparator])
        )
        addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-4-[rightSeparator]-4-|",
                options: [],
                metrics: nil,
                views: ["rightSeparator": rightSeparator])
        )
    }
}
