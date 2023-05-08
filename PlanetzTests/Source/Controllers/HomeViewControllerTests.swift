//
//  HomeViewControllerTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 08/05/23.
//

import XCTest
@testable import Planetz

class HomeViewControllerTests: XCTestCase {
    
    func testHomeViewController_whenProvidedEmptyPlanet() {
        //MockPlanetService
        class MockPlanetServiceClinetClient: PlanetService {
            func fetchPlanets() async -> [Planetz.Planet] {
                return []
            }
        }
        //Mock DataStore
        class MockDataStore: DataStoreProtocol {
            func save(for key: Planetz.DSKeys, value: Data) { }
            func get(key: Planetz.DSKeys) -> Data? { return nil }
        }

        let expt = expectation(description: "TestHomeViewController")
        let sut = HomeViewController(planetServiceClinet: MockPlanetServiceClinetClient(),
                                     dataStore: MockDataStore(),
                                     dataFormatter: JSONFormatter())
        
        sut.fetchPlanetData {
            let planetCount = sut.planets.count
            XCTAssertEqual(planetCount, 0)
            expt.fulfill()
        }

        waitForExpectations(timeout: 10)
        
    }
    
    func testHomeViewController_whenProvidedPlanetData() {
        //MockPlanetService
        class MockPlanetServiceClinetClient: PlanetService {
            func fetchPlanets() async -> [Planetz.Planet] {
                return MockPlanetResponse.planets
            }
        }
        
        let sut = HomeViewController(planetServiceClinet: MockPlanetServiceClinetClient(),
                                     dataStore: MockDataStore(),
                                     dataFormatter: JSONFormatter())
        
        let expt = expectation(description: "TestHomeViewController")
        sut.fetchPlanetData {
            let planetCount = sut.planets.count
            XCTAssertEqual(planetCount, 1)
            expt.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
}

extension XCTestCase {
    class MockDataStore: DataStoreProtocol {
        func save(for key: Planetz.DSKeys, value: Data) { }
        func get(key: Planetz.DSKeys) -> Data? { return nil }
    }
}
