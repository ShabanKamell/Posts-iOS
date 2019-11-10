import Foundation
import UIKit

typealias Image = UIImage

struct BaseURL {
    static let baseURL = "\(BaseURL.scheme)://\(BaseURL.host)"
    static let shareURL = "\(BaseURL.scheme)://\(BaseURL.shareHost)"
    static let landingPageURL = URL(string: "https://hitchhiker.io/")!
    static let faqURL = URL(string: "https://help.hitchhiker.io/")!
    static let privacyURL = URL(string: "https://hitchhiker.io/terms-privacy")!

    static let scheme = "https"
    static let apiVersion = "v2"
    static let chatAPIVersion = "v1"

    #if DEBUG
        static let chatHost = "chat-dev.hitchhiker.io"
        static let host = "api-dev.hitchhiker.io"
        static let shareHost = "app-dev.hitchhiker.io"
    #else
        static let chatHost = "chat.hitchhiker.io"
        static let host = "api.hitchhiker.io"
        static let shareHost = "app.hitchhiker.io"
    #endif

    static func imageURL(for stringURL: String) -> URL? {
        return URL(string: BaseURL.baseURL + stringURL)
    }
}

enum RequestMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ContenType: String {
    case formData = "multipart/form-data"
    case formMixed = "multipart/mixed"
    case json = "application/json"
    case html = ""
}

enum RequestAuthentication {
    case required
    case optional
}

typealias Request = RequestProtocol
protocol RequestProtocol {
    var params: [String: Any] { get }

    func method() -> RequestMethod
    func path() -> String
    func contentType() -> ContenType
    func cachePolicy() -> NSURLRequest.CachePolicy
    func scheme() -> String
    func host() -> String
    func apiVersion() -> String

    func urlRequest() -> URLRequest
}

extension RequestProtocol {

    fileprivate var absoluteURLString: String {

        var urlComponents = URLComponents()
        urlComponents.scheme = scheme()
        urlComponents.host = host()
        urlComponents.path = "/\(apiVersion())/\(path())"

        var queryItems = [URLQueryItem]()
        if case .get = method() {
            params.forEach {
                let queryItem = URLQueryItem(name: $0, value: String(describing: $1))
                queryItems.append(queryItem)
            }
            urlComponents.queryItems = queryItems
        }

        return urlComponents.url!.absoluteString
    }

    func urlRequest() -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: self.absoluteURLString)!)
        urlRequest.cachePolicy = cachePolicy()
        urlRequest.httpMethod = method().rawValue
        urlRequest.setValue(contentType().rawValue, forHTTPHeaderField: "Content-Type")

        switch method() {
        case .post, .patch, .put:
            switch contentType() {
            case .formData, .formMixed:
                let boundary = String(format: "hitchhiker.boundary.%08x%08x",
                                      UInt32.random(in: UInt32.min...UInt32.max),
                                      UInt32.random(in: UInt32.min...UInt32.max))
                urlRequest.setValue("\(contentType().rawValue); boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
                let body = multiFormData(from: params, boundary: boundary)
                urlRequest.httpBody = body
            case .json:
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            case .html: break
            }
        default: break
        }
        return urlRequest
    }

    func scheme() -> String { return BaseURL.scheme }
    func host() -> String { return BaseURL.host }
    func apiVersion() -> String { return BaseURL.apiVersion }

    func contentType() -> ContenType { return .json }
    func cachePolicy() -> NSURLRequest.CachePolicy { return .useProtocolCachePolicy }

    func print() {
        #if DEBUG
            Swift.print("##########\n")
            Swift.print("RequestURLString: " + absoluteURLString + "\n")
            Swift.print("Method: " + method().rawValue + "\n")
            if method().rawValue != RequestMethod.get.rawValue {
                Swift.print("Parameters " + params.debugDescription + "\n")
            }
            Swift.print("##########\n")
        #else
            Swift.print("Request " + String(reflecting: self) + "\n")
        #endif
    }
}

// MARK: - Private methods
extension Request {
    func multiFormData(from params: [String: Any], boundary: String) -> Data? {
        var body = Data()
        for param in params {
            if let value = param.value as? Image {
                body.append("--\(boundary)\r\n".data(using: .utf8)!)
                body.append("Content-Disposition: form-data; name=\(param.key); filename=imageName.jpg\r\n".data(using: .utf8)!)
                body.append("Content-Type: image/jpg\r\n\r\n".data(using: .utf8)!)
                body.append(value.jpegData(compressionQuality: 0.8)!)
                body.append("\r\n".data(using: .utf8)!)
            } else if let value = param.value as? [Image] {
                for (index, image) in value.enumerated() {
                    body.append("--\(boundary)\r\n".data(using: .utf8)!)
                    let name = "\(param.key)[\(index)]"
                    let fileName = "imageName[\(index)].jpg"
                    body.append("Content-Disposition: form-data; name=\(name); filename=\(fileName)\r\n".data(using: .utf8)!)
                    body.append("Content-Type: image/jpg\r\n\r\n".data(using: .utf8)!)
                    body.append(image.jpegData(compressionQuality: 0.8)!)
                    body.append("\r\n".data(using: .utf8)!)
                }
            } else {
                body.append("--\(boundary)\r\n".data(using: .utf8)!)
                body.append("Content-Disposition: form-data; name=\(param.key)\r\n\r\n".data(using: .utf8)!)
                body.append("\(String(describing: param.value))\r\n".data(using: .utf8)!)
            }
        }
        body.append("--\(boundary)--".data(using: .utf8)!)
        return body
    }
}
