//Copyright HitchHiker© 2017. All rights reserved.

import Foundation

extension NSObject {
    var className: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last ?? ""
    }

    public class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
