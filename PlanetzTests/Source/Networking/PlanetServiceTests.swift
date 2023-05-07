//
//  PlanetServiceTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 05/05/23.
//

import XCTest
@testable import Planetz

final class PlanetServiceTests: XCTestCase {

    func testFetchPlanets_Failed_ReturnsEmptyArray() async throws {
        
        class MockNetworking: NetworkingProtocol {
            func fetch(_ adapter: BaseRequestAdapter) async -> (Data?, NetworkError?) {
                return (nil, .unknown)
            }
        }
        
        let environment = MockEnvironment()
        let networking: NetworkingProtocol = MockNetworking()
        
        let client = PlanetServiceClient(
            environment: environment,
            networking: networking
        )
        
        let data = await client.fetchPlanets()
        XCTAssertEqual(data.count, 0)
    }
    
    func testFetchPlanets_Success_ReturnsPlanetData() async {
        class MockNetworking: NetworkingProtocol {
            func fetch(_ adapter: BaseRequestAdapter) async -> (Data?, NetworkError?) {
                return (MockPlanetResponse.sampleData.data(using: .utf8), nil)
            }
        }
        
        let environment = MockEnvironment()
        let networking: NetworkingProtocol = MockNetworking()
        
        let client = PlanetServiceClient(
            environment: environment,
            networking: networking
        )
        
        let data = await client.fetchPlanets()
        
        XCTAssertEqual(data.count, 1)
    }

}
