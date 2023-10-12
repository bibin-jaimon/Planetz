//
//  HomeViewModelTest.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 12/10/23.
//

import XCTest
@testable import Planetz

class MockHomeViewModelTest: XCTestCase {
    
    func testHomeViewController_whenProvidedEmptyPlanet_planetArrayShouldHaveCorrectCount() {
        
        let mockDataStore = MockDataStore()
        var sut = HomeModel(planetService: EmptyPlanetServiceClinet(),
                            dataStore: mockDataStore,
                            dataFormatter: JSONFormatter())
        
        
        let expt = expectation(description: "TestHomeViewModel")
        
        sut.onReceive = { planets in
            let planetCount = planets.count
            XCTAssertEqual(planetCount, 0)
            XCTAssertFalse(mockDataStore.isCalledSaveMethodWithPlanetKey)
            XCTAssertTrue(mockDataStore.isCalledToReadPersistingData)
            expt.fulfill()
        }
        
        sut.fetchPlanetData()
            
        waitForExpectations(timeout: 10)
    }
    
    func testHomeViewController_whenProvidedPlanetData_planetArrayShouldHaveCorrectCount() {
        let mockDataStore = MockDataStore()
        var sut = HomeModel(planetService: MockPlanetServiceClinet(),
                                     dataStore: mockDataStore,
                                     dataFormatter: JSONFormatter())

        let expt = expectation(description: "TestHomeViewModel")
        sut.onReceive = { planets in
            let planetCount = planets.count
            XCTAssertEqual(planetCount, 1)
            XCTAssertTrue(mockDataStore.isCalledSaveMethodWithPlanetKey)
            expt.fulfill()
        }
        
        sut.fetchPlanetData()

        waitForExpectations(timeout: 10)
    }

}
