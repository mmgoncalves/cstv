//
//  URLSessionProtocol.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import Foundation

public protocol URLSessionProtocol {
    func data(for request: URLRequest, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }
