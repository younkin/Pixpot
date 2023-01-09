//
//  RequestBuilder.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation

enum Endpoint {
    case none
    case main
    case product
    case cart
    
    var rawValue: String {
        switch self {
        case .none:
            return "/"
        case .main:
            return  "/v3/654bd15e-b121-49ba-a588-960956b15175"
        case .product:
            return "/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        case .cart:
            return "/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
        }
    }
}

enum HTTPMethod: String {
    case POST
    case PUT
    case GET
    case DELETE
    case PATCH
}

protocol RequestBuildable {
    var host: String { get }
    var path: Endpoint { get }

    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
    var headers: [String: String] { get }

    func set(host: String) -> Self
    func set(path: Endpoint) -> Self
    func set(method: HTTPMethod) -> Self
    func set<T: Encodable>(parameters: T) -> Self
    func add(header name: String, value: String) -> Self
    func set(headers: [String: String]) -> Self

    func build() -> URLRequest?
}

class RequestBuilder: RequestBuildable {

    private(set) var host: String = "https://run.mocky.io"
    private(set) var path: Endpoint = .none

    private(set) var method: HTTPMethod = .GET
    private(set) var parameters: [String: Any] = [:]
    private(set) var headers: [String: String] = ["Accept": "application/json",
                                                  "Content-Type": "application/json"]
    @discardableResult
    func set(host: String) -> Self {
        self.host = host
        return self
    }

    @discardableResult
    func set(path: Endpoint) -> Self {
        self.path = path
        return self
    }

    @discardableResult
    func set(method: HTTPMethod) -> Self {
        self.method    = method
        return self
    }

    @discardableResult
    func set<T: Encodable>(parameters: T) -> Self {
        if let dictionary = parameters as? [String: Any] {
            self.parameters = dictionary
        } else {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            guard let jsonData = try? encoder.encode(parameters) else { return self }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) else { return self }
            if let dictionary = jsonObject as? [String: Any] {
                self.parameters = dictionary
            }
        }
        return self
    }

    @discardableResult
    func add(header name: String, value: String) -> Self {
        self.headers[name] = value
        return self
    }

    @discardableResult
    func set(headers: [String: String]) -> Self {
        self.headers.merge(headers) { (_, last) -> String in
            last
        }
        return self
    }

    func build() -> URLRequest? {
        guard var urlComponents = URLComponents(string: host) else { return nil }
        urlComponents.path = path.rawValue
        print("path: \(urlComponents.url) ")
        let isGetMethod = method == .GET
        if  !parameters.isEmpty, isGetMethod {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value as? String )}
        }

        guard let url = urlComponents.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        
        
        if !parameters.isEmpty, !isGetMethod {
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            urlRequest.httpBody = jsonData
            print("jsonData: \(parameters)")
        }

        headers.forEach { key, value in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }

        
        
        parameters = [:]
        headers = ["Accept": "application/json",
                   "Content-Type": "application/json"]
        return urlRequest
    }

}
