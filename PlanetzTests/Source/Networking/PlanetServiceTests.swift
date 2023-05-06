//
//  PlanetServiceTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 05/05/23.
//

import XCTest
@testable import Planetz

final class PlanetServiceTests: XCTestCase {

    func testExample() async throws {
        let environment = DefaultEnvironment()
        let networking = Networking(session: URLSession.shared)
        
        let client = PlanetServiceClient(
            environment: environment,
            networking: networking
        )
        
        let planets = await client.fetchPlanets(path: "/planets")
    }

}
