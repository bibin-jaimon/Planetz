//
//  UrlRequestAdapter.swift
//  Planetz
//
//  Created by Bibin Jaimon on 06/05/23.
//

import Foundation

protocol UrlRequestAdapter: BaseRequestAdapter {
    var urlString: String { get }
}

extension UrlRequestAdapter {
    var requestURLString: String {
        urlString
    }
}

