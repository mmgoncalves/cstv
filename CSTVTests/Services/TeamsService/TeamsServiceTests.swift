//
//  TeamsServiceTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 12/08/23.
//

@testable import CSTV
import XCTest

final class TeamsServiceTests: XCTestCase {
    private var sut: TeamsService!
    private var apiClientMock: APIClientMock!
    
    override func setUp() {
        super.setUp()
        apiClientMock = .init()
        sut = .init(apiClient: apiClientMock)
    }
    
    func testRequest() async {
        // - given
        let expectedData = [Team.mock(id: 1)]
        apiClientMock.response = .success(expectedData)
        
        // - when
        let result = await sut.fetchTeam(teamOneId: 1, teamTwoId: 2)
        
        // - then
        switch result {
        case .success(let teams):
            XCTAssertEqual(teams.first?.id, expectedData.first?.id)
        case .failure:
            XCTFail("Should not fail")
        }
    }
    
    func testFailRequest() async {
        // - given
        apiClientMock.response = .failure(.badRequest)
        
        // - when
        let result = await sut.fetchTeam(teamOneId: 1, teamTwoId: 2)
        
        // - then
        switch result {
        case .success:
            XCTFail("Should not be success")
        case .failure(let networkError):
            XCTAssertEqual(networkError, NetworkError.badRequest)
        }
    }
}
