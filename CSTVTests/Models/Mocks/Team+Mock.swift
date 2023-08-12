//
//  Team+Mock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 10/08/23.
//

@testable import CSTV

extension Team {
    static func mock(id: Int) -> Team {
        .init(
            id: id,
            image: "",
            name: "Team Name",
            players: [
                .mock(id: id+1),
                .mock(id: id+2),
                .mock(id: id+3),
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
