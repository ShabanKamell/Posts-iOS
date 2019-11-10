//
// Created by mac on 2019-07-10.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

extension String {

    func colored(
            coloredText: String,
            color: UIColor = .red
    ) -> NSMutableAttributedString {

        let attributedString = NSMutableAttributedString(string: self)

        let range = (self as NSString).range(of: coloredText)

        attributedString.setAttributes(
                [NSAttributedString.Key.foregroundColor: color],
                range: range
        )
        return attributedString
    }

}

extension UILabel {

    func coloredString(
            text: String,
            coloredText: String,
            color: UIColor = .red
    ) {
        numberOfLines = 0
        self.attributedText = text.colored(coloredText: coloredText, color: color)
    }

}