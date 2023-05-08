//
//  DataStore.swift
//  Planetz
//
//  Created by Bibin Jaimon on 07/05/23.
//

import Foundation

/// To be used for storing the any data in a persistance storage
protocol DataStoreProtocol {
    /// To be used to save data
    /// - Parameters:
    ///     - key: Type of DSKeys
    ///     - value: To be the value to store in the storage
    func save(for key: DSKeys, value: Data)
    
    /// To be used to retrive data from persistance storage
    /// - Parameters:
    ///     - key: Type of DSKeys
    /// - Returns: Optional value with type Data.
    func get(key: DSKeys) -> Data?
}

/// To be used for declaring key for the DataStore methods
enum DSKeys: String {
    case planets = "planets"
}

class DataStore: DataStoreProtocol {
    
    let userDefault: UserDefaults = .standard
    
    func save(for key: DSKeys, value: Data) {
        userDefault.set(value, forKey: key.rawValue)
    }
    
    func get(key: DSKeys) -> Data? {
        userDefault.data(forKey: key.rawValue)
    }
}
