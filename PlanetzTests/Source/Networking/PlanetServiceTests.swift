//
//  PlanetServiceTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 05/05/23.
//

import XCTest
@testable import Planetz

final class PlanetServiceTests: XCTestCase {
    
    //API success
    //API failure

    func testFetchPlanets_Success() async throws {
        let environment = MockEnvironment()
        
        let networking = Networking(session: URLSession.shared)
        
        let client = PlanetServiceClient(
            environment: environment,
            networking: networking
        )
        
        let _ = await client.fetchPlanets()
        
    }

}
