//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""

extension Bundle {
    static func loadView<T: UIView>(fromNib name: String, withType type: T.Type) -> T {
        if let view = main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        fatalError("Could not load view with type " + String(describing: type))
    }
}
