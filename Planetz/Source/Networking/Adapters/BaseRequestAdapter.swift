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

/// The protocol to be used for creating URLRequest
protocol BaseRequestAdapter {
    /// The HTTPMethod for the request
    var method: HTTPMethod { get }
    
    /// The parameters for the request
    var parameters: Parameters? { get }
    
    /// The request URL
    var requestURLString: String { get }
    
    /// The method to generate URLRequest
    func build() -> URLRequest?
}

extension BaseRequestAdapter {
    
    /// The method used to add query params to the http request
    private func buildGetUrlComponent(urlString: String) -> URLComponents? {
        var urlRequest = URLComponents(string: urlString)
        
        if let parameter = self.parameters {
            let queryItems = parameter.map { URLQueryItem(name: "\($0)", value: "\($1)") }
            urlRequest?.queryItems = queryItems
        }
        
        return urlRequest
    }
    
    /// To build GET http request
    private func buildGetRequest() -> URLRequest? {
        guard !requestURLString.isEmpty else { return nil }
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
