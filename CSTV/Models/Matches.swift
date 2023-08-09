//
//  Matches.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

import SwiftUI

final class Matches: ObservableObject {
    @Published var matches: [Match] = []
}

struct Match: Codable, Identifiable {
    let id: Int
    let league: League
    let status: MatchStatus
    let opponents: [Opponents]
    let serie: Serie
    
    enum MatchStatus: String, Codable {
        case running
        case notStarted = "not_started"
        case finished
    }
}

struct League: Codable {
    let image: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "image_url"
    }
}

struct Opponents: Codable {
    let opponent: Opponent
}

struct Opponent: Codable {
    let id: Int
    let image: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "image_url"
        case id
    }
}

struct Serie: Codable {
    let name: String?
}
