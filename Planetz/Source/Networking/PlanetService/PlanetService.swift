//
//  PlanetServiceManager.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import Foundation

protocol PlanetService {
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
        let (res, _) = await networking.fetch(adapter)
        guard let data = res else { return [] }
        guard let formatterData = dataFormatter.decodeToJSON(to: PlanetListResponseModel.self, for: data) else { return [] }
        return formatterData.results
    }
}
