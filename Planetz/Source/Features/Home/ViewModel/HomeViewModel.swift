//
//  HomeViewModel.swift
//  Planetz
//
//  Created by Bibin Jaimon on 10/10/23.
//

import Foundation

protocol HomeViewModel {
    var onReceive: (([Planet]) -> Void)? { set get }
    func fetchPlanetData()
}

struct HomeModel: HomeViewModel {
    
    private var planetService: PlanetService
    private var dataStore: DataStoreProtocol
    private var dataFormatter: DataFormatter
    var onReceive: (([Planet]) -> Void)? = nil
    
    init(planetService: PlanetService,
         dataStore: DataStoreProtocol,
         dataFormatter: DataFormatter
    ) {
        self.planetService = planetService
        self.dataStore = dataStore
        self.dataFormatter = dataFormatter
    }
    
    func fetchPlanetData() {
        Task {
            var planets = await planetService.fetchPlanets()
            //check if the planets are empty then read it from the storage otherwise store it.
            if planets.isEmpty {
                planets = getSavedPlanets()
            } else {
                saveToDataStore(planets)
            }
            onReceive?(planets)
        }
    }
    
    private func saveToDataStore(_ planets: [Planet]) {
        guard let data = dataFormatter.encodeToData(planets) else { return }
        dataStore.save(for: .planets, value: data)
    }
    
    private func getSavedPlanets() -> [Planet] {
        guard let data = dataStore.get(key: .planets) else { return [] }
        guard let planets = dataFormatter.decodeToJSON(to: [Planet].self, for: data) else { return [] }
        return planets
    }
}
