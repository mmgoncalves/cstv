//
//  TeamsServiceMock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 11/08/23.
//

@testable import CSTV

final class TeamsServiceMock: TeamsServiceprotocol {
    var response: Result<[Team]>?
    private(set) var teamOneId: Int?
    private(set) var teamTwoId: Int?
    
    func fetchTeam(teamOneId: Int, teamTwoId: Int) async -> Result<[Team]> {
        self.teamOneId = teamOneId
        self.teamTwoId = teamTwoId
        return response ?? .failure(.undefined)
    }
}
