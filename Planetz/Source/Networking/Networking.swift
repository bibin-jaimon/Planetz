//
//  Networking.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case noInternet
    case invalidRequest
    case unknown
}

protocol NetworkingProtocol {
    func fetch(_ adapter: BaseRequestAdapter) async -> (Data?, NetworkError?)
}

final class Networking: NetworkingProtocol {
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetch(_ adapter: BaseRequestAdapter) async -> (Data?, NetworkError?) {
        guard let request: URLRequest = adapter.build() else { return (nil, .invalidRequest) }
        
        do {
            let (data, _) = try await session.data(for: request)
            return (data, nil)
        } catch(let error) {
            let kNSError = error as NSError
            
            // Handle No Internet issue
            if kNSError.code == NSURLErrorNotConnectedToInternet {
                return (nil, .noInternet)
            }
            
            return (nil, .unknown)
        }
    }
}
