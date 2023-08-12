//
//  MatchServiceMock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV

final class MatchServiceMock: MatchServiceProtocol {
    var response: Result<[Match]>?
    private(set) var page: Int?
    private(set) var beginAt: String?
    private(set)var endAt: String?
    
    func fetchMatches(page: Int, beginAt: String, endAt: String) async -> Result<[Match]> {
        self.page = page
        self.beginAt = beginAt
        self.endAt = endAt
        return response ?? .failure(.undefined)
    }
}
