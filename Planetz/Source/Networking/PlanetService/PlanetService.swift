//
//  PlanetServiceManager.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import Foundation

/// To be used to implment /planets related services
protocol PlanetService {
    /// To fetch array of planets
    /// - Returns: Array of Planet objects
    func fetchPlanets() async -> [Planet]
}

class PlanetServiceClient: PlanetService {
    
    private var networking: NetworkingProtocol
    private var environment: Environment
    private var dataFormatter: DataFormatter
    
    required init(environment: Environment,
                  networking: NetworkingProtocol,
                  dataFormatter: DataFormatter = JSONFormatter()) {
        self.networking = networking
        self.environment = environment
        self.dataFormatter = dataFormatter
    }
    
    func fetchPlanets() async -> [Planet] {
        let adapter = PlanetListRequestAdapter(path: "/planets", method: .get, environment: environment)
        guard let result = try? await networking.fetch(adapter) else { return [] }
        
        switch result {
        case .success(let data):
            guard let formatterData = dataFormatter
                .decodeToJSON(to: PlanetListResponseModel.self, for: data) else { return [] }
            return formatterData.results
        case .failure:
            return []
        }
    }
}
