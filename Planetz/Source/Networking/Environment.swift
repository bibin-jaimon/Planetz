//
//  Environment.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import Foundation

protocol Environment {
    var baseURL: String { get }
}

struct DefaultEnvironment: Environment {
    var baseURL: String {
        "https://swapi.dev/api"
    }
}
