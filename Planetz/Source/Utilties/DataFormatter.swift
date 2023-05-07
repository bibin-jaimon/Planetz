//
//  DataFormatter.swift
//  Planetz
//
//  Created by Bibin Jaimon on 07/05/23.
//

import Foundation

protocol DataFormatter {
    func decodeToJSON<T: Decodable>(to: T.Type, for data: Data) -> T?
    func encodeToData<T: Decodable>(from: T) -> Data?
}

class JSONFormatter: DataFormatter {
    private let jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
    }
    
    func decodeToJSON<T: Decodable>(to type: T.Type, for data: Data) -> T? {
        do {
            let result = try jsonDecoder.decode(type, from: data)
            return result
        } catch (let error) {
            debugPrint("DataFormatter error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func encodeToData<T: Decodable>(from: T) -> Data? {
        return nil
    }
}
