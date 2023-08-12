//
//  PlayerViewTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 12/08/23.
//

@testable import CSTV
import SnapshotTesting
import XCTest
import SwiftUI

final class PlayerViewTests: XCTestCase {
    func testLoadingView() {
        let view = PlayerView_Previews.previews
            .frame(width: 300, height: 60)
        assertSnapshots(matching: view, as: [.image])
    }
}
