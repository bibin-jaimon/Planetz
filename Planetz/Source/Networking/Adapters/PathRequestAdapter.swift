//
//  PathRequestAdapter.swift
//  Planetz
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation

/// To creata a URLRequest for a path like /planet
/// Required environment object for base url
protocol PathRequestAdapter: BaseRequestAdapter {
    var path: String { get }
    var environment: Environment { get }
}

extension PathRequestAdapter {
    var requestURLString: String {
        environment.baseURL + path
    }
}
