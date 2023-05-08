//
//  HomeViewController.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var planetServiceClinet: PlanetService
    private var dataStore: DataStoreProtocol
    private var homeView: HomeView?
    private var dataFormatter: DataFormatter
    
    var planets: [Planet] = [] {
        didSet {
            self.updateHomeView(data: planets)
        }
    }
    
    init(planetServiceClinet: PlanetService, dataStore: DataStoreProtocol, dataFormatter: DataFormatter) {
        self.planetServiceClinet = planetServiceClinet
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
        self.homeView?.startLoader()
        fetchPlanetData({ [weak self] in
            self?.homeView?.stopLoader()
        })
    }
    
    func fetchPlanetData(_ completion: (() -> Void)? = nil) {
        Task { [weak self] in
            guard let strongSelf = self else { return }
            let planets = await strongSelf.planetServiceClinet.fetchPlanets()
            strongSelf.handle(planets)
            completion?()
        }
    }
    
    /// To handle data from server and local storage
    private func handle(_ planets: [Planet]) {
        if planets.isEmpty {
            self.planets = getSavedPlanets()
            return
        }
        self.planets = planets
        self.saveToDataStore(planets)
    }
    
    private func updateHomeView(data: [Planet]) {
        self.homeView?.update(planets: data)
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

