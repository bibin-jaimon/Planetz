//
//  MockAdapter.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation
@testable import Planetz

struct MockAdapter: PathRequestAdapter {
    var path: String { "/planet" }
    var environment: Environment { MockEnvironment() }
    var method: HTTPMethod { .get }
    var parameters: Parameters? { nil }
}

struct InvalidURLMockAdapter: PathRequestAdapter {
    var path: String { "/planet" }
    var environment: Environment { MockEnvironment() }
    var method: HTTPMethod { .get }
    var parameters: Parameters? { nil }
    func build() -> URLRequest? {
        return nil
    }
}
