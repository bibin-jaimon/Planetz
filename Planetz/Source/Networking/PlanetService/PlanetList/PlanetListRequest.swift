//
//  PlanetListRequest.swift
//  Planetz
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation

struct PlanetListRequestAdapter: PathRequestAdapter {
    var path: String
    var method: HTTPMethod
    var parameters: Parameters?
    var environment: Environment
}
