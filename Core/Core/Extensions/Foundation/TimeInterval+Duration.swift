//Copyright HitchHiker© 2017. All rights reserved.

import Foundation

extension TimeInterval {
    private var minutes: Int {
        return (Int(self) / 60 ) % 60
    }

    private var hours: Int {
        return Int(self) / 3600
    }

    var stringTime: String {
        return "\(hours)h \(minutes)m"
    }
}
