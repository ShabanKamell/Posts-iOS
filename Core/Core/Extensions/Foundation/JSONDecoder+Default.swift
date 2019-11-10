//Copyright HitchHiker© 2017. All rights reserved.

import Foundation

extension JSONDecoder {
    static var `default`: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .custom { decoder in try decodeDate(decoder) }
        return jsonDecoder
    }

    func decode<T>(_ type: T.Type, fromJSONObject jsonObject: Any) throws -> T where T : Decodable {
        let data = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
        return try decode(type, from: data)
    }
}

// MARK: - Private methods
extension JSONDecoder {
    fileprivate static func decodeDate(_ decoder: Decoder) throws -> Date {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)

        let isoDateFormatter = ISO8601DateFormatter()
        if let date = isoDateFormatter.date(from: stringValue) {
            return date
        } else {
            let isoFullDateFormatter = DateFormatter.iso8601Full
            if let date = isoFullDateFormatter.date(from: stringValue) {
                return date
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "YYYY-MM-dd"
                if let date = dateFormatter.date(from: stringValue) {
                    return date
                } else {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "hh:mm:ss"
                    if let date = dateFormatter.date(from: stringValue) {
                        return date
                    }
                }
            }
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(stringValue)")
    }
}
