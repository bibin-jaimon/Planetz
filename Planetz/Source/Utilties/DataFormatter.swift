//
//  DataFormatter.swift
//  Planetz
//
//  Created by Bibin Jaimon on 07/05/23.
//

import Foundation

protocol DataFormatter {
    func decodeToJSON<T: Decodable>(to: T.Type, for data: Data) -> T?
    func encodeToData<T: Encodable>(_ data: T) -> Data?
}

class JSONFormatter: DataFormatter {
    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder(), jsonEncoder: JSONEncoder = JSONEncoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
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
    
    func encodeToData<T: Encodable>(_ data: T) -> Data? {
        do {
            let result = try jsonEncoder.encode(data)
            return result
        } catch (let error) {
            debugPrint("DataFormatter error: \(error.localizedDescription)")
            return nil
        }
    }
}
