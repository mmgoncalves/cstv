//
//  CardViewTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 12/08/23.
//

@testable import CSTV
import SnapshotTesting
import XCTest

final class CardViewTests: XCTestCase {
    func testLoadingView() {
        let view = CardView_Previews.previews
            .frame(width: 300, height: 500)
        assertSnapshots(matching: view, as: [.image])
    }
}
