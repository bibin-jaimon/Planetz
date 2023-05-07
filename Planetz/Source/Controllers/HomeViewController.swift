//
//  HomeViewController.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var networkClient: PlanetService
    private var dataStore: DataStoreProtocol
    private var homeView: HomeView?
    private var dataFormatter: DataFormatter
    
    var planets: [Planet] = [] {
        didSet {
            self.updateHomeView(data: planets)
        }
    }
    
    init(networkClient: PlanetService, dataStore: DataStoreProtocol, dataFormatter: DataFormatter) {
        self.networkClient = networkClient
        self.dataStore = dataStore
        self.dataFormatter = dataFormatter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.homeView = HomeView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPlanetData()
        
    }
    
    private func fetchPlanetData() {
        self.homeView?.startLoader()
        Task { [weak self] in
            guard let self = self else { return }
            let planets = await networkClient.fetchPlanets()
            self.handle(planets)
        }
    }
    
    private func handle(_ planets: [Planet]) {
        if planets.isEmpty {
            self.planets = getSavedPlanets()
            return
        }
        self.planets = planets
        self.save(planets)
    }
    
    private func updateHomeView(data: [Planet]) {
        self.homeView?.update(planets: data)
        self.homeView?.stopLoader()
    }
    
    private func save(_ planets: [Planet]) {
        if planets.isEmpty { return }
        guard let data = dataFormatter.encodeToData(planets) else { return }
        dataStore.save(for: .planets, value: data)
    }
    
    private func getSavedPlanets() -> [Planet] {
        guard let data = dataStore.get(key: .planets) else { return [] }
        guard let planets = dataFormatter.decodeToJSON(to: [Planet].self, for: data) else { return [] }
        return planets
        
    }

}

