//
//  NetworkingTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 06/05/23.
//

import XCTest
@testable import Planetz

final class NetworkingTests: XCTestCase {
    
    func testNetworking_whenEmptyURLProvided_returnsError() async throws {
        let mockAdapter = MockEmptyURLRequestAdapter()
        let sut = Networking(session: .shared)
        
        let result = try await sut.fetch(mockAdapter)
        XCTAssertNil(try? result.get())
        
        if case .failure(let error) = result {
            XCTAssertEqual(error, .invalidRequest)
        }
    }
    
}
