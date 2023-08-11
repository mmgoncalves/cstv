//
//  Opponents.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import Foundation

struct Opponents: Codable {
    let team: Team
    
    enum CodingKeys: String, CodingKey {
        case team = "opponent"
    }
}
