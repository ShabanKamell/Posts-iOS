//
// Created by mac on 11/25/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public protocol Mapper {
    associatedtype I
    associatedtype O
    func map(_ input: I) -> O
}

public protocol ListMapperProtocol {
    associatedtype I
    associatedtype O
    func map(_ input: [I]) -> [O]
}

public struct ListMapper<M: Mapper>: ListMapperProtocol {
    public typealias I = M.I
    public typealias O = M.O

    private let mapper: M

    public init(_ mapper: M) {
        self.mapper = mapper
    }

    public func map(_ input: [M.I]) -> [M.O] {
        input.map { mapper.map($0) }
    }
}


public protocol NullableInputListMapperProtocol {
    associatedtype I
    associatedtype O
    func map(_ input: [I]?) -> [O]
}

public struct NullableInputListMapper<M: Mapper>: NullableInputListMapperProtocol {
    public typealias I = M.I
    public typealias O = M.O

    private let mapper: M

    public init(_ mapper: M) {
        self.mapper = mapper
    }

    public func map(_ input: [M.I]?) -> [M.O] {
        input?.map { mapper.map($0) } ?? []
    }
}

public protocol NullableOutputListMapperProtocol {
    associatedtype I
    associatedtype O
    func map(_ input: [I]) -> [O]?
}

public struct NullableOutputListMapper<M: Mapper>: NullableOutputListMapperProtocol {
    public typealias I = M.I
    public typealias O = M.O

    private let mapper: M

    public init(_ mapper: M) {
        self.mapper = mapper
    }

    public func map(_ input: [M.I]) -> [M.O]? {
        input.isEmpty ? nil : input.map { mapper.map($0) }
    }
}
