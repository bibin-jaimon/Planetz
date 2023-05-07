//
//  DataStore.swift
//  Planetz
//
//  Created by Bibin Jaimon on 07/05/23.
//

import Foundation

protocol DataStoreProtocol {
    func save(for key: DSKeys, value: Data)
    func get(key: DSKeys) -> Data?
}

enum DSKeys: String {
    case planets = "planets"
}

class DataStore: DataStoreProtocol {
    func save(for key: DSKeys, value: Data) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    func get(key: DSKeys) -> Data? {
        UserDefaults.standard.data(forKey: key.rawValue)
    }
}
