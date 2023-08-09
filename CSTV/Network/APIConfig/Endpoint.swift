//
//  Endpoint.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

import Foundation

public protocol Endpoint {
    var path: String { get }
    var method: ResquestMethod { get }
    var queryParams: [URLQueryItem] { get }
}

public enum ResquestMethod: String {
    case get = "GET"
    case post = "POST"
}
