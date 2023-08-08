//
//  APIClient.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(NetworkError)
}

public protocol APIClient {
    func request<T: Decodable>(_ endpoint: any Endpoint) async -> Result<T>
}
