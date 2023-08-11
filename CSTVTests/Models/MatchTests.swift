//
//  MatchTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 10/08/23.
//

@testable import CSTV
import XCTest

final class MatchTests: XCTestCase {
    private var sut: Match!
    
    override func setUp() {
        super.setUp()
    }
    
    func testTodayMatchTime() {
        // - given
        let date = Calendar.current.date(bySettingHour: 20, minute: 30, second: 0, of: Date())!
        sut = .mock(id: 1, beginAt: date.ISO8601Format())
        
        // - when
        let matchTime = sut.matchTime
        
        // - then
        XCTAssertEqual(matchTime, "Hoje, 20:30")
    }
    
    func testNotTodayMatchTime() {
        // - given
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = formatter.date(from: "2023-01-27 20:30")!
        sut = .mock(id: 1, beginAt: date.ISO8601Format())
        
        // - when
        let matchTime = sut.matchTime
        
        // - then
        XCTAssertEqual(matchTime, "27.01 20:30")
    }
}
