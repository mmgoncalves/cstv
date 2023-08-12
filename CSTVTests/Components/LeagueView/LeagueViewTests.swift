//
//  LeagueViewTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 12/08/23.
//

@testable import CSTV
import SnapshotTesting
import XCTest

final class LeagueViewTests: XCTestCase {
    func testLoadingView() {
        let view = LeagueView_Previews.previews
            .frame(width: 300, height: 500)
        LeagueView_Previews.leagueImage = ""
        assertSnapshots(matching: view, as: [.image])
    }
    
    func testLoadingViewNoImageLeague() {
        let view = LeagueView_Previews.previews
            .frame(width: 300, height: 500)
        LeagueView_Previews.leagueImage = nil
        assertSnapshots(matching: view, as: [.image])
    }
}
