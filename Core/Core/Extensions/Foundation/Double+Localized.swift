//Copyright HitchHiker© 2017. All rights reserved.

import Foundation

extension Double {
    var localized: String {
        let number = NSNumber(value: self)
        return NumberFormatter.localizedString(from: number, number: .decimal)
    }
}
