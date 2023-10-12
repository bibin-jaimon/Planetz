//
//  MockViewModel.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 12/10/23.
//

import Foundation
@testable import Planetz

class MockHomeViewModel: HomeViewModel {
    var isCalledFetchPlanetData = false
    var onReceive: (([Planetz.Planet]) -> Void)?
    
    func fetchPlanetData() {
        isCalledFetchPlanetData = true
    }
    
    
}
