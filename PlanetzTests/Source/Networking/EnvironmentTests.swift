//
//  EnvironmentTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 08/05/23.
//

import XCTest
@testable import Planetz

class EnvironmentTests: XCTestCase {
    func testDefaultEnvironment() {
        let env: EnvironmentProvider = MockEnvironment()
        XCTAssertEqual("fake-endpoint", env.current.baseURL)
    }
}
