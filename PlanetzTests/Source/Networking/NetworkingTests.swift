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
    
//    func testExample() async throws {
//        URLProtocol.registerClass(MockURLProtocol.self)
//
//        let mockConfig = URLSessionConfiguration.ephemeral
//        MockURLProtocol.stubResponseData = Data()
//        mockConfig.protocolClasses = [MockURLProtocol.self]
//        let mockSession = URLSession(configuration: mockConfig)
//
//        let mockAdapter = MockAdapter()
//
//        let sut = Networking(session: mockSession)
////        let (data, response) = try await URLSession.shared.data(for: mockAdapter.build()!)
//        let (data, _) = await sut.fetch(mockAdapter)
//        print(data)
//
//
//    }
    
    func testNetworking_whenEmptyURLProvided_returnsError() async {
        let mockAdapter = MockEmptyURLRequestAdapter()
        let sut = Networking(session: .shared)
        
        let (data, error) = await sut.fetch(mockAdapter)
        
        XCTAssertNil(data)
        XCTAssertEqual(error, .invalidRequest)
    }

}
