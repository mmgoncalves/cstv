//
//  NetworkAdapterMock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV
import Foundation

final class NetworkAdapterMock: NetworkAdapterProtocol {
    var response: Result<Data>?
    
    func request(endpoint: Endpoint) async -> Result<Data> {
        response ?? .failure(.undefined)
    }
}
