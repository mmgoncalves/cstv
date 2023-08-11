//
//  MatchDetailViewModel.swift
//  CSTV
//
//  Created by Mateus Marques on 11/08/23.
//

import Foundation

final class MatchDetailViewModel: ObservableObject {
    @Published private(set) var playersTeamOne: [Player] = []
    @Published private(set) var playersTeamTwo: [Player] = []
    @Published private (set) var isLoading = false
    
    var title: String {
        match.league.name + (match.serie.name ?? "")
    }
    var matchTime: String? {
        match.matchTime
    }
    
    private let match: Match
    private let teamsService: TeamsServiceprotocol
    
    init(
        match: Match,
        teamsService: TeamsServiceprotocol = TeamsService()
    ) {
        self.match = match
        self.teamsService = teamsService
    }
    
    func loadTeams() async {
        await MainActor.run { [weak self] in
            self?.isLoading = true
        }

        let teamsId = getTeamsId()
        let result = await teamsService.fetchTeam(
            teamOneId: teamsId.teamOneId,
            teamTwoId: teamsId.teamTwoId
        )
        
        switch result {
        case .success(let teams):
            await MainActor.run(body: { [weak self] in
                self?.handleResult(teams)
            })
        case .failure(let networkError):
            print("NetworkError =>", networkError)
        }
        
        await MainActor.run { [weak self] in
            self?.isLoading = false
        }
    }
    
    private func handleResult(_ teams: [Team]) {
        if teams.indices.contains(0) {
            let team = teams[0]
            playersTeamOne = team.players ?? []
        }
        
        if teams.indices.contains(1) {
            let team = teams[1]
            playersTeamTwo = team.players ?? []
        }
    }
    
    private func getTeamsId() -> (teamOneId: Int, teamTwoId: Int) {
        (match.opponents[0].team.id, match.opponents[1].team.id)
    }
}
