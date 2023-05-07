//
//  UrlRequestAdapter.swift
//  Planetz
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation

/// To create a URLRequest adapter with full URL
protocol UrlRequestAdapter: BaseRequestAdapter {
    
    /// The full URL used to create a URLRequest
    var urlString: String { get }
}

extension UrlRequestAdapter {
    var requestURLString: String {
        urlString
    }
}

