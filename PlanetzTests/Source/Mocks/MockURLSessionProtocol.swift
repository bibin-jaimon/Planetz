//
//  MockURLSessionProtocol.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation
//URLProtocol.registerClass(MockURLProtocol.self)

class MockURLProtocol: URLProtocol {
    static var stubResponseData: Data?
    
    override class func canInit(with request: URLRequest) -> Bool { true }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }
    
    override func startLoading() {
        guard let data = MockURLProtocol.stubResponseData else { return }
        client?.urlProtocol(self, didLoad: data)
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
}



class TestURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) -> (HTTPURLResponse, Data?, Error?))?

    override class func canInit(with request: URLRequest) -> Bool {
        // Return true if we want to intercept this request
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        // No need to modify the request, so return as is
        return request
    }

    override func startLoading() {
        guard let handler = TestURLProtocol.requestHandler else { return }

        let (response, data, error) = handler(request)
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        if let data = data {
            client?.urlProtocol(self, didLoad: data)
        }
        if let error = error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
