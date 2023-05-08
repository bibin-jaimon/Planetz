//
//  PlanetServiceTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 05/05/23.
//

import XCTest
@testable import Planetz

final class PlanetServiceTests: XCTestCase {

    func testFetchPlanets_failed_returnsEmptyArray() async throws {
        
        class MockNetworking: NetworkingProtocol {
            func fetch(_ adapter: BaseRequestAdapter) async -> Result<Data, NetworkError> {
                .failure(.invalidRequest)
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
    
    func testFetchPlanets_success_returnsPlanetData() async {
        class MockNetworking: NetworkingProtocol {
            func fetch(_ adapter: BaseRequestAdapter) async -> Result<Data, NetworkError> {
                return .success(MockPlanetResponse.sampleData.data(using: .utf8)!)
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
