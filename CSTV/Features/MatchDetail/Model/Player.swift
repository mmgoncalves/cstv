//
//  Player.swift
//  CSTV
//
//  Created by Mateus Marques on 10/08/23.
//

import Foundation

struct Player: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let image: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case image = "image_url"
        case id, name
    }
}
