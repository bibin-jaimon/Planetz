//
//  MockEnvironment.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation
@testable import Planetz

struct MockEnvironment: Environment {
    var baseURL: String { "https://swapi.dev/api" }
}
