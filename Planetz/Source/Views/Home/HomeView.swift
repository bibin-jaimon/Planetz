//
//  HomeView.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import UIKit

class HomeView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(planets: [Planet]) {
        DispatchQueue.main.async {
            
        }
    }
    
    func isLoadingView(visible: Bool) {
        
    }
}
