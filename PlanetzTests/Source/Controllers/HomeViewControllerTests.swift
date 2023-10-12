//
//  HomeViewControllerTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 08/05/23.
//

import XCTest
@testable import Planetz

class HomeViewControllerTests: XCTestCase {

    func test() {
        let sut = HomeViewController(planetServiceClinet: MockPlanetServiceClinet(),
                                     dataStore: MockDataStore(),
                                     dataFormatter: JSONFormatter())
        let mockHomeViewModel = MockHomeViewModel()
        
        sut.testSupport.setHomeViewModel(model: mockHomeViewModel)
        
        sut.viewWillAppear(true)
        
        XCTAssertEqual(true, mockHomeViewModel.isCalledFetchPlanetData)
    }

    func testHomeViewController_whenCalledLoadView_viewShouldHaveValue() {
        
        let sut = HomeViewController(planetServiceClinet: MockPlanetServiceClinet(),
                                     dataStore: MockDataStore(),
                                     dataFormatter: JSONFormatter())
        
        sut.loadView()
        XCTAssertNotNil(sut.testSupport.getHomeView())
    }
    
}

extension XCTestCase {
    
    /// To check if the method are calling on time
    class MockDataStore: DataStoreProtocol {
        var isCalledSaveMethodWithPlanetKey = false
        var isCalledToReadPersistingData = false

        func save(for key: Planetz.DSKeys, value: Data) {
            isCalledSaveMethodWithPlanetKey = key == .planets
        }
        
        func get(key: Planetz.DSKeys) -> Data? {
            isCalledToReadPersistingData = true
            return nil
        }
    }
    
    /// Mock instance with fetchPlanet returning array with Planet instance
    class MockPlanetServiceClinet: PlanetService {
        func fetchPlanets() async -> [Planetz.Planet] {
            return MockPlanetResponse.planets
        }
    }
    
    /// Mock instance with fetchPlanet returning empty array
    class EmptyPlanetServiceClinet: PlanetService {
        func fetchPlanets() async -> [Planetz.Planet] {
            return []
        }
    }
}
