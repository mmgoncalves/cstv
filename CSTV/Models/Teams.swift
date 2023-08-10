//
//  Teams.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

import SwiftUI

final class Teams: ObservableObject {
    @Published var teams: [Team] = []
}

struct Team: Codable, Identifiable {
    let id: Int
    let image: String?
    let name: String
    let players: [Player]?
    
    enum CodingKeys: String, CodingKey {
        case image = "image_url"
        case id, name, players
    }
}
