//
// Created by mac on 2019-08-18.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {

    convenience init(
            data: Data,
            documentType: DocumentType,
            encoding: String.Encoding = .utf8
    ) throws {



       /* let richText = try NSMutableAttributedString(
                data: data,
                options: [.documentType: documentType,
                          .characterEncoding: encoding.rawValue],
                documentAttributes: nil
        )

        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.right

        richText.addAttribute(
                .paragraphStyle,
                value: style,
                range: NSMakeRange(0, richText.length)
        )*/

        try self.init(
                data: data,
                options: [.documentType: documentType,
                          .characterEncoding: encoding.rawValue],
                documentAttributes: nil
        )
    }

    convenience init(html data: Data) throws {
        try self.init(data: data, documentType: .html)
    }

    convenience init(txt data: Data) throws {
        try self.init(data: data, documentType: .plain)
    }

    convenience init(rtf data: Data) throws {
        try self.init(data: data, documentType: .rtf)
    }

    convenience init(rtfd data: Data) throws {
        try self.init(data: data, documentType: .rtfd)
    }
}

extension StringProtocol {
    var data: Data { return Data(utf8) }
    var htmlToAttributedString: NSMutableAttributedString? {
        do {
           let richText = try NSMutableAttributedString.init(html: Data(utf8))

            let style = NSMutableParagraphStyle()
            style.alignment = NSTextAlignment.right
            style.lineSpacing = 2

            richText.addAttribute(
                    .paragraphStyle,
                    value: style,
                    range: NSMakeRange(0, richText.length)
            )

//            richText.addAttribute(
//                    .font,
//                    value: UIFont.systemFont(ofSize: 40),
//                    range: NSMakeRange(0, richText.length)
//            )

//            richText.addAttribute(
//                    .foregroundColor,
//                    value: UIColor.black,
//                    range: NSMakeRange(0, richText.length)
//            )
//
//            richText.addAttribute(
//                    .backgroundColor,
//                    value: UIColor.black,
//                    range: NSMakeRange(0, richText.length)
//            )

            return richText
        } catch {
            print("html error:", error)
            return nil
        }
    }
    var htmlDataToString: String? {
        return htmlToAttributedString?.string
    }
}

extension Data {
    var htmlToAttributedString: NSMutableAttributedString? {
        do {
            return try .init(html: self)
        } catch {
            print("html error:", error)
            return nil
        }

    }
}