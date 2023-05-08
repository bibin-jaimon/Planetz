//
//  HomeViewTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 08/05/23.
//

import XCTest
@testable import Planetz

final class HomeViewTests: XCTestCase {
    
    let mockPlanets = MockPlanetResponse.planets
    
    func testHomeView_whenProvided_planetData() throws {
        let sut = HomeView()
        sut.testSupport.setupPlanetTableView()
        
        
        XCTAssertNotNil(sut.testSupport.tableView)
        XCTAssertNotNil(sut.testSupport.tableBackgroundView)
        
        /// Check expected number of rows count before setting data
        let expectedNumberOfRowsInSection1 = sut.tableView(sut.testSupport.tableView!, numberOfRowsInSection: 0)
        XCTAssertEqual(expectedNumberOfRowsInSection1, 0)
        
        sut.testSupport.setPlanetData(data: mockPlanets)
        
        /// Check expected number of rows count after setting data
        let expectedNumberOfRowsInSection2 = sut.tableView(sut.testSupport.tableView!, numberOfRowsInSection: 0)
        XCTAssertEqual(expectedNumberOfRowsInSection2, mockPlanets.count)
        
        /// Check tableView has proper cell registered
        let cell2 = sut.testSupport.tableView?.dequeueReusableCell(withIdentifier: PlanetListCell.identifier,
                                                       for: [0, 0])
        XCTAssertTrue(cell2 is PlanetListCell)
        
        /// Check cellForRowAt function receiving proper cell instance
        let cell = sut.tableView(sut.testSupport.tableView!, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is PlanetListCell)
    }

}
