//
//  Team+Mock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 10/08/23.
//

@testable import CSTV

extension Team {
    static func mock() -> Team {
        .init(
            id: 1,
            image: "",
            name: "Team Name",
            players: [
                .mock(id: 1),
                .mock(id: 2),
                .mock(id: 3),
            ]
        )
    }
}

extension Player {
    static func mock(id: Int = 1) -> Player {
        .init(
            id: id,
            firstName: "First",
            lastName: "Last",
            image: "",
            name: "Player Name"
        )
    }
}
