//
//  TeamsService.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import Foundation

protocol TeamsServiceprotocol {
    func fetchTeam(teamOneID: Int, teamTwoID: Int) async -> Result<[Team]>
}

final class TeamsService: TeamsServiceprotocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient = RequestAPIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchTeam(teamOneID: Int, teamTwoID: Int) async -> Result<[Team]> {
        let endpoint = TeamsEndpoint(teamOneID: teamOneID, teamTwoID: teamTwoID)
        return await apiClient.request(endpoint)
    }
}
