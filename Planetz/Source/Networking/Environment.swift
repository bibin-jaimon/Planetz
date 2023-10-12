//
//  Environment.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import Foundation

protocol EnvironmentConfig {
    var baseURL: String { get }
    var identifier: EnvironmentIdentifier { get }
}

enum EnvironmentIdentifier {
    case development
    case production
}

protocol EnvironmentProvider {
    var current: EnvironmentConfig { get }
}

struct DevelopmentEnvironment: EnvironmentConfig {
    var identifier: EnvironmentIdentifier = .development
    var baseURL: String { "https://swapi.dev/api" }
}

struct ProductionEnvironment: EnvironmentConfig {
    var identifier: EnvironmentIdentifier = .production
    var baseURL: String { "https://swapi.dev/api" }
}

struct Environment: EnvironmentProvider {
    var current: EnvironmentConfig {
        switch self.identifier {
        case .development:
            return DevelopmentEnvironment()
        case .production:
            return ProductionEnvironment()
        }
    }
    
    private var identifier: EnvironmentIdentifier
    
    init(identifier: EnvironmentIdentifier) {
        self.identifier = identifier
    }
}
