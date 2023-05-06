//
//  HomeViewController.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var networkClient: PlanetService
    var planets: [Planet] = []
    var homeView: HomeView?
    
    init(networkClient: PlanetService) {
        self.networkClient = networkClient
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
            self.updatePlanetData(data: planets)
        }
    }
    
    private func updatePlanetData(data: [Planet]) {
        self.planets = data
        self.homeView?.update(planets: data)
        self.homeView?.stopLoader()
    }

}

