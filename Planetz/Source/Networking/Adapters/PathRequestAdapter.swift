//
//  PathRequestAdapter.swift
//  Planetz
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation

protocol PathRequestAdapter: BaseRequestAdapter {
    var path: String { get }
    var environment: Environment { get }
}

extension PathRequestAdapter {
    var requestURLString: String {
        environment.baseURL + path
    }
}
