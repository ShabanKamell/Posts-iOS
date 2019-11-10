//Copyright HitchHiker© 2017. All rights reserved.

import Foundation

extension JSONEncoder {
    static var `default`: JSONEncoder {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        jsonEncoder.dateEncodingStrategy = .iso8601
        return jsonEncoder
    }
}
