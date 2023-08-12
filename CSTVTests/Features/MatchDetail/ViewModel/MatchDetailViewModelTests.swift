//
//  MatchDetailViewModelTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 11/08/23.
//

@testable import CSTV
import XCTest

final class MatchDetailViewModelTests: XCTestCase {
    private var sut: MatchDetailViewModel!
    private var teamsServiceMock: TeamsServiceMock!
    private var matchMock: Match!
    
    override func setUp() {
        super.setUp()
        teamsServiceMock = .init()
        matchMock = .mock(id: 1, beginAt: Date.now.ISO8601Format())
        sut = .init(
            match: matchMock,
            teamsService: teamsServiceMock
        )
    }
    
    func testLoadTeams() async {
        // - given
        let expectedTeamOne = Team.mock(id: 1)
        let expectedTeamTwo = Team.mock(id: 2)
        teamsServiceMock.response = .success([expectedTeamOne, expectedTeamTwo])
        
        // - when
        await sut.loadTeams()
        
        // - then
        XCTAssertEqual(teamsServiceMock.teamOneId, 1)
        XCTAssertEqual(teamsServiceMock.teamTwoId, 2)
        XCTAssertEqual(sut.playersTeamOne, expectedTeamOne.players)
        XCTAssertEqual(sut.playersTeamTwo, expectedTeamTwo.players)
        
        XCTAssertNotEqual(sut.playersTeamOne, expectedTeamTwo.players)
        XCTAssertNotEqual(sut.playersTeamTwo, expectedTeamOne.players)
    }
}
