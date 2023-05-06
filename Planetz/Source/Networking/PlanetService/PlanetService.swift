//
//  PlanetServiceManager.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import Foundation

class PlanetServiceClient {
    
    private var networking: Networking
    private var environment: Environment
    
    init(environment: Environment, networking: Networking) {
        self.networking = networking
        self.environment = environment
    }
    
    func fetchPlanets(path: String) async -> [Planet] {
        let adapter = PlanetListRequestAdapter(path: "/planets", method: .get, environment: environment)
        do {
            guard let data = await networking.perform(pathAdapter: adapter) else { return [] }
            let planets = try JSONDecoder().decode(PlanetListResponseModel.self, from: data)
            return planets.results
        } catch {
            // Handle errors
        }
        return []
    }
}
