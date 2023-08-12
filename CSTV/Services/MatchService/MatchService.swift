//
//  MatchService.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

import Foundation

protocol MatchServiceProtocol {
    func fetchMatches(page: Int, beginAt: String, endAt: String) async -> Result<[Match]>
}

final class MatchService: MatchServiceProtocol {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient = RequestAPIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchMatches(page: Int, beginAt: String, endAt: String) async -> Result<[Match]> {
        let endpoint = MatchEndpoint(page: page, beginAt: beginAt, endAt: endAt)
        return await apiClient.request(endpoint)
    }
}
