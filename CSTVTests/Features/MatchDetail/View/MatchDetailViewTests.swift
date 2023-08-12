//
//  MatchDetailViewTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 12/08/23.
//

@testable import CSTV
import XCTest
import SnapshotTesting

final class MatchDetailViewTests: XCTestCase {
    func testLoadingView() {
        let view = MatchDetailView()
            .frame(width: 300, height: 500)
            .environmentObject(MatchDetailViewModel(match: .mock(id: 1)))
        assertSnapshots(matching: view, as: [.wait(for: 2, on: .image)])
    }
}
