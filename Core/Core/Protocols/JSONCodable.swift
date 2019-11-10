//Copyright HitchHiker© 2017. All rights reserved.

import Foundation

typealias JSONCodable = JSONDecodable & JSONEncodable

protocol JSONDecodable {
    init(from: Any) throws
}

extension JSONDecodable where Self: Codable {
    init(from jsonObject: Any) throws {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
        self = try JSONDecoder.default.decode(Self.self, from: jsonData)
    }
}

protocol JSONEncodable {
    func jsonEncode() -> [String: Any]?
}

extension JSONEncodable where Self: Codable {
    func jsonEncode() -> [String: Any]? {
        guard let encodedData = try? JSONEncoder.default.encode(self) else { return nil }
        guard let data = try? JSONSerialization.jsonObject(with: encodedData, options: .allowFragments) else { return nil }
        return data as? [String: Any]
    }
}
