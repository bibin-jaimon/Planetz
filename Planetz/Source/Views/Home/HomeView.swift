//
//  HomeView.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import UIKit

class HomeView: BaseView {
    
    private var planet: [Planet] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let loadingView: LoadingView = {
        let view = LoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emptyInfoView = InfoView()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func constructView() {
        addSubview(tableView)
        addSubview(loadingView)
    }
    
    override func configureView() {
        
        NSLayoutConstraint.activate([
            loadingView.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            loadingView.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.tableView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        setupPlanetTableView()
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
        self.planet.count
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
