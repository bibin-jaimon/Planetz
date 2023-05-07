//
//  BaseRequestAdapterTest.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 07/05/23.
//

import XCTest
@testable import Planetz

class BaseRequestAdapterTest: XCTestCase {
    
    func testBaseRequestAdapter_returnsGetURLRequest() {
        
        struct MockBaseRequestAdapter: BaseRequestAdapter {
            var method: HTTPMethod { .get }
            
            var parameters: Parameters? { [
                "param1": "value1"
            ] }
            
            var requestURLString: String { "http://www.sample.com" }
        }
        
        let expectedURLString: String = "http://www.sample.com?param1=value1"
        let expectedHttpMethod = "GET"
        
        let sut: BaseRequestAdapter = MockBaseRequestAdapter()
        
        guard let urlRequest: URLRequest = sut.build() else {
            XCTFail("Failed to build valid URLRequest")
            return
        }
        
        if let url = urlRequest.url {
            XCTAssertEqual(url.absoluteString, expectedURLString)
        } else {
            XCTFail("Invalid URL")
        }
        
        if let httpMethod = urlRequest.httpMethod {
            XCTAssertEqual(httpMethod, expectedHttpMethod)
        } else {
            XCTFail("Invalid HTTP Method")
        }

    }
    
}
