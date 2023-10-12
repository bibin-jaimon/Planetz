//
//  MockAdapter.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation
@testable import Planetz

struct MockAdapter: BaseRequestAdapter {
    var route: String { "/planet" }
    var environment: Environment { MockEnvironment() }
    var method: HTTPMethod { .get }
    var parameters: Parameters? { nil }
    var requestURLString: String {
        environment.baseURL + route
    }
}

struct MockEmptyRequestAdapter: BaseRequestAdapter {
    var route: String { "" }
    var requestURLString: String { "" }
    var method: HTTPMethod { .get }
    var parameters: Parameters? { nil }
}
