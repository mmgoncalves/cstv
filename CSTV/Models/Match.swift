//
//  Match.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import Foundation

final class Match: Codable, Identifiable, ObservableObject {
    let id: Int
    let league: League
    let status: MatchStatus
    let opponents: [Opponents]
    let serie: Serie
    
    init(id: Int, league: League, status: MatchStatus, opponents: [Opponents], serie: Serie) {
        self.id = id
        self.league = league
        self.status = status
        self.opponents = opponents
        self.serie = serie
    }
    
    enum MatchStatus: String, Codable {
        case running
        case notStarted = "not_started"
        case finished
    }
}
