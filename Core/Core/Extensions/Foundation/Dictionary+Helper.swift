//Copyright HitchHiker© 2017. All rights reserved.

import Foundation

extension Dictionary where Key == String {
    func removeNulls() -> [String: Any] {
        var dict: [String: Any] = self

        let keysToRemove = dict.keys.filter { dict[$0] is NSNull }
        let keysToCheck = dict.keys.filter({ dict[$0] is Dictionary })
        for key in keysToRemove {
            dict.removeValue(forKey: key)
        }
        for key in keysToCheck {
            if let valueDict = dict[key] as? [String: Any] {
                dict.updateValue(valueDict.removeNulls(), forKey: key)
            }
        }
        dict.forEach { dict[$0.key] = unwrap($0.value) }
        return dict
    }

    fileprivate func unwrap<T>(_ any: T) -> Any {
        let mirror = Mirror(reflecting: any)
        guard mirror.displayStyle == .optional, let first = mirror.children.first else {
            return any
        }
        return first.value
    }
}
