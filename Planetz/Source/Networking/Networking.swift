//
//  Networking.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import Foundation
import UIKit

/// These are the errors might return from Networking Protocol
enum NetworkError: Error, Equatable {
    case noInternet
    case invalidRequest
    case failedRequest(description: String)
}

/// To be used for  handling all network related interactions
protocol NetworkingProtocol {
    /// Request data from an endpoint
    ///  - Parameters
    ///  - adapter: instance of BaseRequestAdapter which used to build the URLRequest
    ///  - Returns: Tuple with data and NetworkError. Eg: (Data?, NetworkError?)
    func fetch(_ adapter: BaseRequestAdapter) async -> (Data?, NetworkError?)
}

final class Networking: NetworkingProtocol {
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    /// Request data from an endpoint
    ///  - Parameter adapter: instance of BaseRequestAdapter which used to build the URLRequest
    ///  - Returns: Tuple with data and NetworkError. Eg: (Data?, NetworkError?)
    func fetch(_ adapter: BaseRequestAdapter) async -> (Data?, NetworkError?) {
        guard let request: URLRequest = adapter.build() else { return (nil, .invalidRequest) }
        
        do {
            let (data, _) = try await session.data(for: request, delegate: nil)
            return (data, nil)
        } catch(let error) {
            let kNSError = error as NSError
            
            // Handle No Internet issue
            if kNSError.code == NSURLErrorNotConnectedToInternet {
                return (nil, .noInternet)
            }
            
            return (nil, .failedRequest(description: error.localizedDescription))
        }
    }
}
