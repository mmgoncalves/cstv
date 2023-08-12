//
//  MatchListViewModelTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV
import XCTest

final class MatchListViewModelTests: XCTestCase {
    private var sut: MatchListViewModel!
    private var matchServiceMock: MatchServiceMock!
    private var initialDate: Date!
    
    override func setUp() {
        super.setUp()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YYYY-MM-dd"
        initialDate = dateFormat.date(from: "2023-08-09")
        matchServiceMock = .init()
        sut = .init(matchService: matchServiceMock, initialDate: initialDate)
    }
    
    func testLoadMatches() async {
        // - given
        let expectedBeginAt = "2023-08-09"
        let expectedEndAt = "2022-08-09"
        let matches: [Match] = [
            .mock(id: 1),
            .mock(id: 2)
        ]
        matchServiceMock.response = .success(matches)
        XCTAssertEqual(sut.matches.count, 0)
        
        // - when
        await sut.loadMatches()
        
        // - then
        XCTAssertEqual(matchServiceMock.page, 1)
        XCTAssertEqual(matchServiceMock.beginAt, expectedBeginAt)
        XCTAssertEqual(matchServiceMock.endAt, expectedEndAt)
        XCTAssertEqual(sut.matches.count, 2)
    }
    
    func testLoadMoreMatchesIfNeeded() async {
        // - given
        let expectedBeginAt = "2023-08-09"
        let expectedEndAt = "2022-08-09"
        let matches: [Match] = [
            .mock(id: 1),
            .mock(id: 2)
        ]
        matchServiceMock.response = .success(matches)
        await sut.loadMatches()
        XCTAssertEqual(sut.matches.count, 2)
        XCTAssertEqual(matchServiceMock.page, 1)
        
        // - when
        await sut.loadMoreMatchesIfNeeded(.mock(id: 2))
        
        // - then
        XCTAssertEqual(matchServiceMock.page, 2)
        XCTAssertEqual(matchServiceMock.beginAt, expectedBeginAt)
        XCTAssertEqual(matchServiceMock.endAt, expectedEndAt)
        XCTAssertEqual(sut.matches.count, 4)
    }
    
    func testReloadMatches() async {
        // - given
        let matches: [Match] = [
            .mock(id: 1),
            .mock(id: 2)
        ]
        matchServiceMock.response = .success(matches)
        
        // - when
        await sut.reloadList()
        await sut.reloadList()
        await sut.reloadList()
        
        // - then
        XCTAssertEqual(matchServiceMock.page, 1)
        XCTAssertEqual(sut.matches.count, 2)
    }
}
