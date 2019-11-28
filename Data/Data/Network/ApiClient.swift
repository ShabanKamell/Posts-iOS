//
// Created by mac on 2019-03-25.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Moya
import Core

private func jsonResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(decoding: prettyData, as: UTF8.self)
    } catch { return String(decoding: data, as: UTF8.self) }
}

let api = createProvider()

private func createProvider() -> MoyaProvider<Api> {
    var config = NetworkLoggerPlugin.Configuration()

    // Log Options
    var logOptions = NetworkLoggerPlugin.Configuration.LogOptions()
    logOptions.insert(NetworkLoggerPlugin.Configuration.LogOptions.verbose)
    config.logOptions = logOptions

    // Formatter
    config.formatter = NetworkLoggerPlugin.Configuration.Formatter(responseData: jsonResponseDataFormatter)

    let logger = NetworkLoggerPlugin(configuration: config)

    return MoyaProvider<Api>(plugins: [logger])
}

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

    public var validationType: ValidationType { .none }
    public var sampleData: Data { Data() }
    public var headers: [String: String]? { nil }
    var parameters: [String: Any]? { nil }
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
