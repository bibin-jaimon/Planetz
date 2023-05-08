//
//  PlanetListCellTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 08/05/23.
//

import XCTest
@testable import Planetz

final class PlanetListCellTests: XCTestCase {
    
    func testPlanetListCell_reuseIdentifier() {
        XCTAssertEqual(PlanetListCell.identifier, "PlanetListCell")
    }

    func testPlanetListCell_whenProvidingPlanetData() throws {
        
        let sut = PlanetListCell()
        let planet = MockPlanetResponse.planets.first!
        sut.setupCell(planet: planet)
        
        XCTAssertNotNil(sut.contentConfiguration)
        
        let config = sut.contentConfiguration as? UIListContentConfiguration
        
        XCTAssertEqual(config?.text, planet.name)
        XCTAssertEqual(config?.secondaryText, planet.terrain)
        XCTAssertNotNil(config?.image)
    }

}
