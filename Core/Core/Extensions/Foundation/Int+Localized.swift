//Copyright HitchHiker© 2017. All rights reserved.

import Foundation

extension Int {
    var localized: String {
        let number = NSNumber(value: self)
        return NumberFormatter.localizedString(from: number, number: .none)
    }
}
