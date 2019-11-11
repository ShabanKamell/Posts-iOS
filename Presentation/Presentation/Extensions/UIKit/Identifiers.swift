//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit

public enum Identifier: String {
    case postCell = "PostCell"
    case loadingCell = "LoadingCell"

    func nib(bundle: Bundle) -> UINib {
        return UINib(nibName: self.rawValue, bundle: bundle)
    }

    func view<T: UIView>() -> T {
        return UINib(nibName: self.rawValue, bundle: nil)
                .instantiate(withOwner: self.rawValue, options: nil).first
                as! T
    }


}
