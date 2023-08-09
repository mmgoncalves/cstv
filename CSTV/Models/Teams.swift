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
    let players: [Player]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case players
        case image = "image_url"
    }
}

struct Player: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let image: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case firstName = "first_name"
        case lastName = "last_name"
        case image = "image_url"
    }
}