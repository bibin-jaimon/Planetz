//
//  MockEnvironment.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation
@testable import Planetz

struct MockEnvConfig: EnvironmentConfig {
    var baseURL: String
    var identifier: Planetz.EnvironmentIdentifier = .development
}

struct MockEnvironment: EnvironmentProvider {
    var current: Planetz.EnvironmentConfig = MockEnvConfig(baseURL: "fake-endpoint")
}
