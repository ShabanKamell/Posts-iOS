//
// Created by mac on 2019-03-28.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation

public extension Encodable {

    func encode() -> Data {
        return try! JSONEncoder().encode(self)
    }

}

extension Decodable {

   public func decode<T>(from data: Data) -> T {
        return try! JSONDecoder().decode(type(of: self), from: data) as! T
    }

}
