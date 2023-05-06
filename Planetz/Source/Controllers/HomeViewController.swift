//
//  HomeViewController.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var loadPlanets: (([Planet]) -> Void)?

    override func loadView() {
        self.view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //call planet api
    
    }

}

