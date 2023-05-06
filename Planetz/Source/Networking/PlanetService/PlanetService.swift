//
//  PlanetServiceManager.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import Foundation

protocol PlanetService {
    init(environment: Environment, networking: Networking)
    func fetchPlanets() async -> [Planet]
}

class PlanetServiceClient: PlanetService {
    
    private var networking: Networking
    private var environment: Environment
    
    required init(environment: Environment, networking: Networking) {
        self.networking = networking
        self.environment = environment
    }
    
    func fetchPlanets() async -> [Planet] {
        let adapter = PlanetListRequestAdapter(path: "/planets", method: .get, environment: environment)
        do {
            guard let data = await networking.fetch(adapter) else { return [] }
            let planets = try JSONDecoder().decode(PlanetListResponseModel.self, from: data)
            return planets.results
        } catch {
            // Handle errors
        }
        return []
    }
}
