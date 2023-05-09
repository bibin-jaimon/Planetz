//
//  DateFormatterTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 09/05/23.
//

import XCTest
@testable import Planetz

final class DateFormatterTests: XCTestCase {
    
    var dataFormatter: DataFormatter?

    override func setUp() {
        dataFormatter = JSONFormatter()
    }

    func testDataFormatter_encode() throws {
        let sut = try XCTUnwrap(dataFormatter)
        let inputData = MockPlanetResponse.planets
        let data = sut.encodeToData(inputData)
        
        XCTAssertNotNil(data)
    }
    
    func testDataFormatter_decode() throws {
        let sut = try XCTUnwrap(dataFormatter)
        let inputData = try XCTUnwrap(sut.encodeToData(MockPlanetResponse.planets))
        let result = sut.decodeToJSON(to: [Planet].self, for: inputData)
        let actualData = try XCTUnwrap(result)
        
        XCTAssertEqual(1, actualData.count)
    }
    
    func testDataFormatter_whenProvidedWrongType_shouldReturnsNil() throws {
        let sut = try XCTUnwrap(dataFormatter)
        let inputData = try XCTUnwrap(sut.encodeToData(MockPlanetResponse.planets))
        let result = sut.decodeToJSON(to: Planet.self, for: inputData)
        
        XCTAssertNil(result)
    }
    
    override func tearDown() {
        dataFormatter = nil
    }

}
