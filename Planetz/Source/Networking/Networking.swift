//
//  Networking.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import Foundation
import UIKit

class Networking {
    private var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func perform(pathAdapter adapter: BaseRequestAdapter) async -> Data? {
        guard let request: URLRequest = adapter.build() else { return nil }
        
        do {
            let (data, _) = try await session.data(for: request)
            return data
        } catch(let error) {
            print(error.localizedDescription)
        }
        return nil
    }
}
