//
//  TeamsEndpoint.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import Foundation

struct TeamsEndpoint: Endpoint {
    let path: String = "/teams"
    let method: ResquestMethod = .get
    let queryParams: [URLQueryItem]
    let page = 1
    let perPage = 2
    
    init(teamOneID: Int, teamTwoID: Int) {
        queryParams = [
            .init(name: "page", value: String(page)),
            .init(name: "per_page", value: String(perPage)),
            .init(name: "filter[id]", value: "\(teamOneID),\(teamTwoID)")
        ]
    }
}
