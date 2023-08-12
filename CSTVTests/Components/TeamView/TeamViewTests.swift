//
//  TeamViewTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 12/08/23.
//

@testable import CSTV
import SnapshotTesting
import XCTest

final class TeamViewTests: XCTestCase {
    func testLoadingView() {
        let view = TeamView_Previews.previews
            .frame(width: 300, height: 500)
        assertSnapshots(matching: view, as: [.image])
    }
}
