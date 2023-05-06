//
//  PlanetListResponseModel.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import Foundation

struct PlanetListResponseModel: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
}
