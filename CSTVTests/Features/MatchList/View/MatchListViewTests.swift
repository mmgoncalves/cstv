//
//  MatchListViewTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 12/08/23.
//

@testable import CSTV
import SnapshotTesting
import XCTest

final class MatchListViewTests: XCTestCase {
    func testLoadingView() {
        let view = MatchListView_Previews.previews
        assertSnapshots(matching: view, as: [.image])
    }
}
