//
//  APIClientMock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV

final class APIClientMock: APIClient {
    var response: Result<String>?
    
    func request<T>(_ endpoint: Endpoint) async -> Result<T> where T : Decodable {
        guard let response else {
            return .failure(.undefined)
        }
        
        switch response {
        case .success(let value):
            return .success(value as! T)
        case .failure(let error):
            return .failure(error)
        }
    }
}
