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
    
    var homeView: HomeView?
    
    override func setUp() {
        super.setUp()
        homeView = HomeView()
        homeView?.testSupport.setupPlanetTableView()
    }
    
    func testHomeView_haveCorrectTableViewDataSource() throws {
        let sut = try XCTUnwrap(homeView)
        XCTAssertNotNil(sut.testSupport.tableView?.dataSource)
    }
        
    func testHomeView_whenProvided_planetData() throws {
        let sut = try XCTUnwrap(homeView)
        
        XCTAssertNotNil(sut.testSupport.tableView)
        XCTAssertNotNil(sut.testSupport.tableBackgroundView)
        
    }
    
    func testHomeView_checkTableView_haveCorrectData() throws {
        let sut = try XCTUnwrap(homeView)
        
        /// Check expected number of rows count before setting data
        let expectedNumberOfRowsInSection1 = sut.testSupport.tableView?.numberOfRows(inSection: 0)
        XCTAssertEqual(expectedNumberOfRowsInSection1, 0)
        
        /// Update table view data
        sut.update(planets: mockPlanets)
        sut.testSupport.tableView?.reloadData()

        /// Check expected number of rows count after setting data
        let expectedNumberOfRowsInSection2 = sut.testSupport.tableView?.numberOfRows(inSection: 0)
        XCTAssertEqual(expectedNumberOfRowsInSection2, self.mockPlanets.count)
    }
    
    override func tearDown() {
        homeView = nil
    }

}
