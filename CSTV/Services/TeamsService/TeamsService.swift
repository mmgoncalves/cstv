//
//  TeamsService.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import Foundation

protocol TeamsServiceprotocol {
    func fetchTeam(teamOneId: Int, teamTwoId: Int) async -> Result<[Team]>
}

final class TeamsService: TeamsServiceprotocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient = RequestAPIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchTeam(teamOneId: Int, teamTwoId: Int) async -> Result<[Team]> {
        let endpoint = TeamsEndpoint(teamOneId: teamOneId, teamTwoId: teamTwoId)
        return await apiClient.request(endpoint)
    }
}
