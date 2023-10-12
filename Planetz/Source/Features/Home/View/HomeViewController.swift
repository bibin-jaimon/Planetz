//
//  HomeViewController.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var dataStore: DataStoreProtocol
    private var homeView: HomeView?
    private var dataFormatter: DataFormatter
    private var viewModel: HomeViewModel
    
    init(
        planetServiceClinet: PlanetService,
        dataStore: DataStoreProtocol,
        dataFormatter: DataFormatter
    ) {
        self.dataStore = dataStore
        self.dataFormatter = dataFormatter
        self.viewModel = HomeModel(
            planetService: planetServiceClinet,
            dataStore: dataStore,
            dataFormatter: dataFormatter
        )
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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.homeView?.startLoader()

        viewModel.onReceive = {[weak self] planets in
            DispatchQueue.main.async {
                self?.homeView?.update(planets: planets)
                self?.homeView?.stopLoader()
            }
        }
        
        viewModel.fetchPlanetData()
    }

}

#if DEBUG

// MARK: - User for unit test

/// To access private properties and methods for testing
extension HomeViewController {
    
    var testSupport: TestSupport {
        TestSupport(instance: self)
    }
    
    struct TestSupport {
        private let instance: HomeViewController
        
        fileprivate init(instance: HomeViewController) {
            self.instance = instance
        }

        func setHomeViewModel(model: HomeViewModel) {
            instance.viewModel = model
        }

        func getHomeView() -> HomeView? {
            instance.homeView
        }

    }
}
#endif
