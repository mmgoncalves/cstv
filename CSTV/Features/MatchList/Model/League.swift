//
//  League.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import Foundation

struct League: Codable {
    let image: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "image_url"
    }
}
