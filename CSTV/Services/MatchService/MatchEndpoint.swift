//
//  MatchEndpoint.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

import Foundation

struct MatchEndpoint: Endpoint {
    let path: String = "/matches"
    let method: ResquestMethod = .get
    let queryParams: [URLQueryItem]
    let perPage = 10
    
    init(page: Int, beginAt: String, endAt: String) {
        queryParams = [
            .init(name: "page", value: String(page)),
            .init(name: "per_page", value: String(perPage)),
            .init(name: "filter[opponents_filled]", value: "true"),
            .init(name: "sort", value: "-status"),
            .init(name: "range[begin_at]", value: "\(endAt),\(beginAt)")
        ]
    }
}
