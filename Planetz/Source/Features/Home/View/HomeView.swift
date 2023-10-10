//
//  HomeView.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import UIKit

class HomeView: UIView {
    
    private var planet: [Planet] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let loadingView: LoadingView = {
        let view = LoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emptyInfoView = InfoView()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupTableView()
        setupPlanetTableView()
        setuploadingView()
    }
    
    private func setuploadingView() {
        addSubview(loadingView)
        NSLayoutConstraint.activate([
            loadingView.safeAreaLayoutGuide.centerXAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.centerXAnchor
            ),
            loadingView.safeAreaLayoutGuide.centerYAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.centerYAnchor
            )
        ])
    }
    
    private func setupTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            self.tableView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupPlanetTableView() {
        tableView.register(PlanetListCell.self, forCellReuseIdentifier: PlanetListCell.identifier)
        tableView.dataSource = self
        emptyInfoView.set(message: Strings.noPlanetDataAvailable)
        tableView.backgroundView = emptyInfoView
        
    }
    
    func update(planets: [Planet]) {
        self.planet = planets
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func startLoader() {
        loadingView.startAnimating()
    }
    
    func stopLoader() {
        loadingView.stopAnimating()
    }

}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.planet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlanetListCell.identifier,
                                                       for: indexPath) as? PlanetListCell else {
            return UITableViewCell()
        }
        cell.setupCell(planet: planet[indexPath.row])
        return cell
    }
    
}

#if DEBUG

// MARK: - User for unit test

/// To access private properties and methods for testing
extension HomeView {
    
    var testSupport: TestSupport {
        TestSupport(instance: self)
    }
    
    struct TestSupport {
        private let instance: HomeView
        
        var tableView: UITableView? {
            instance.tableView
        }
        
        var planets: [Planet] {
            instance.planet
        }
        
        var tableBackgroundView: UIView? {
            instance.emptyInfoView
        }
        
        fileprivate init(instance: HomeView) {
            self.instance = instance
        }
        
        func setPlanetData(data: [Planet]) {
            instance.planet = data
        }
        
        func setupPlanetTableView() {
            instance.setupPlanetTableView()
        }
    }
}

#endif
