//
// Created by mac on 2019-06-02.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

extension URL {
    /*
    * example:
    * open(scheme: "tweetbot://timeline")
    */
   static func open(scheme: String) {
        if let url = URL(string: scheme) {

            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                        completionHandler: {
                            (success) in
                            print("Open \(scheme): \(success)")
                        })
                return
            }

            let success = UIApplication.shared.openURL(url)
            print("Open \(scheme): \(success)")

        }
    }
}