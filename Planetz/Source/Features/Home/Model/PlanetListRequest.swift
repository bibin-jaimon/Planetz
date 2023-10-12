//
//  PlanetListRequest.swift
//  Planetz
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation

struct PlanetListRequest: BaseRequestAdapter {
    var route: String
    var method: HTTPMethod
    var parameters: Parameters?
    var environment: EnvironmentProvider
    var requestURLString: String {
        environment.current.baseURL + route
    }
}
