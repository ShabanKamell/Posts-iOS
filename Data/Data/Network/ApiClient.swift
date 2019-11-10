//
// Created by mac on 2019-03-25.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import Core

private func jsonResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

let api = MoyaProvider<Api>(
        plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: jsonResponseDataFormatter)]
)

enum Api {
    case posts(PagingInfo)
    case addPost(Data)
    case editPost(EditPostRequest)
    case deletePost(Int)
}

extension Api: TargetType {

    public var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }

    public var path: String {
        switch self {

        case .posts:
            return "/posts"

        case .addPost:
            return "/posts"

        case let .editPost(request):
            return "/posts/\(request.id)"

        case let .deletePost(id):
            return "/posts/\(id)"

        }
    }

    public var method: Moya.Method {
        switch self {
        case .posts:
            return .get

        case .addPost:
            return .post

        case .editPost:
            return .patch

        case .deletePost:
            return .delete
        }
    }

    public var task: Task {
        switch self {
        case let .posts(pagingInfo):
            var parameters = [String: Any]()
            parameters["_limit"] = pagingInfo.limit
            parameters["_start"] = pagingInfo.start
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case .deletePost:
            return .requestPlain

        case let .addPost(request):
            return .requestData(request)

        case let .editPost(request):
            return .requestData(request.encode())
        }
    }

    public var validationType: ValidationType {
        return .none
    }

    public var sampleData: Data {
        return Data()
    }

    public var headers: [String: String]? {
        return nil
    }

    var parameters: [String: Any]? {
        return nil
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
