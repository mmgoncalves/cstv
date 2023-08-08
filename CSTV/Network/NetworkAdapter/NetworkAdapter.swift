//
//  NetworkAdapter.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

import Foundation

public protocol NetworkAdapterProtocol {
    func request(endpoint: any Endpoint) async -> Result<Data>
}

public final class NetworkAdapter {
    private let apiConfig: APIConfigProtocol
    private let urlSession: URLSession
    
    init(
        apiConfig: APIConfigProtocol = APIConfig.shared,
        urlSession: URLSession = .shared
    ) {
        self.apiConfig = apiConfig
        self.urlSession = urlSession
    }
}

// MARK: - Protocol implementation
extension NetworkAdapter: NetworkAdapterProtocol {
    public func request(endpoint: any Endpoint) async -> Result<Data> {
        let token = apiConfig.token
        let fullPath = apiConfig.basePath + endpoint.path
        do {
            guard var url = URL(string: fullPath) else {
                return .failure(NetworkError.endpointNotExist)
            }
            url.append(queryItems: endpoint.queryParams)
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = endpoint.method.rawValue
            urlRequest.addValue(token, forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await urlSession.data(for: urlRequest)
            return responseHandler(with: data, response: response)
            
        } catch {
            debugPrint("Network error: ", error)
            return .failure(.undefined)
        }
    }
}

// MARK: - Provate methods
extension NetworkAdapter {
    private func responseHandler(with data: Data, response: URLResponse) -> Result<Data> {
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            return .failure(.undefined)
        }
        
        if (200..<300).contains(statusCode) {
            return .success(data)
        } else {
            let error = NetworkError(rawValue: statusCode) ?? .undefined
            return .failure(error)
        }
    }
}

