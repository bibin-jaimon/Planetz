//
//  BaseRequestAdapter.swift
//  Planetz
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation

typealias Parameters = [String: Any]

/// HTTP request methods
enum HTTPMethod {
    case get
}

protocol BaseRequestAdapter {
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var requestURLString: String { get }
    func build() -> URLRequest?
}

extension BaseRequestAdapter {
    
    private func buildGetUrlComponent(urlString: String) -> URLComponents? {
        var urlRequest = URLComponents(string: urlString)
        
        if let parameter = self.parameters {
            let queryItems = parameter.map { URLQueryItem(name: "\($0)", value: "\($1)") }
            urlRequest?.queryItems = queryItems
        }
        
        return urlRequest
    }
    
    private func buildGetRequest() -> URLRequest? {
        guard let components: URLComponents = buildGetUrlComponent(urlString: requestURLString) else { return nil }
        guard let url = components.url else { return nil }
        var request: URLRequest = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        return request
    }
    
    func build() -> URLRequest? {
        switch method {
        case .get:
            return buildGetRequest()
        }
    }
}
