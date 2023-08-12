//
//  MatchTimeViewTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 12/08/23.
//

@testable import CSTV
import SnapshotTesting
import XCTest

final class MatchTimeViewTests: XCTestCase {
    func testLoadingView() {
        let view = MatchTimeView_Previews.previews
            .frame(width: 60, height: 20)
        assertSnapshots(matching: view, as: [.image])
    }
}
