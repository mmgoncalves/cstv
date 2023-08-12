//
//  MatchServiceTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 12/08/23.
//

@testable import CSTV
import XCTest

final class MatchServiceTests: XCTestCase {
    private var sut: MatchService!
    private var apiClientMock: APIClientMock!
    
    override func setUp() {
        super.setUp()
        apiClientMock = .init()
        sut = .init(apiClient: apiClientMock)
    }
    
    func testRequest() async {
        // - given
        let expectedData = [Match.mock(id: 1)]
        apiClientMock.response = .success(expectedData)
        // - when
        let result = await sut.fetchMatches(page: 1, beginAt: "", endAt: "")
        
        // - then
        switch result {
        case .success(let response):
            XCTAssertEqual(response.first?.id, expectedData.first?.id)
        case .failure:
            XCTFail("Should not fail")
        }
    }
    
    func testFailRequest() async {
        // - given
        apiClientMock.response = .failure(.forbidden)
        
        // - when
        let result = await sut.fetchMatches(page: 1, beginAt: "", endAt: "")
        
        // - then
        switch result {
        case .success:
            XCTFail("Should not be success")
        case .failure(let networkError):
            XCTAssertEqual(networkError, NetworkError.forbidden)
        }
    }
}
