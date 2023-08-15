//
//  Match.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import Foundation

struct Match: Codable, Identifiable {
    let id: Int
    let beginAt: String
    let league: League
    let status: MatchStatus?
    let opponents: [Opponents]
    let serie: Serie
    
    var matchTime: String? {
        guard let date = ISO8601DateFormatter().date(from: beginAt) else { return nil }
        let isToday = Calendar.current.isDateInToday(date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = isToday ? "HH:mm" : "dd.MM HH:mm"
        let matchTime = timeFormatter.string(from: date)
        return isToday ? "Hoje, \(matchTime)" : matchTime
    }
    
    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case id, league, status, opponents, serie
    }
    
    enum MatchStatus: String, Codable {
        case running
        case notStarted = "not_started"
        case finished
        case postponed
    }
}
