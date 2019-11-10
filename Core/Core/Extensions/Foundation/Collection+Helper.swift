//Copyright HitchHiker© 2017. All rights reserved.

import Foundation

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

    func contains<T>(obj: T) -> Bool where T : Equatable {
        return !self.filter({$0 as? T == obj}).isEmpty
    }
}
