//
//  NetworkingTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 06/05/23.
//

import XCTest
@testable import Planetz

final class NetworkingTests: XCTestCase {

    //Test fetch success
    //Test fetch failure
    
    func testExample() async throws {
        let mockConfig = URLSessionConfiguration.ephemeral
        mockConfig.protocolClasses = [MockURLProtocol.self]
//        MockURLProtocol.stubResponseData = "nil".data(using: .utf8)
        
        let mockSession = URLSession(configuration: mockConfig)
        let mockAdapter = MockAdapter()
        
        let sut = Networking(session: mockSession)
        
        let _ = await sut.fetch(mockAdapter)
    
    }

}


extension NetworkingTests {
}
