//
//  Match+Mock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV

extension Match {
    static func mock(id: Int, beginAt: String = "") -> Match {
        .init(
            id: id,
            beginAt: beginAt,
            league: .mock(),
            status: .finished,
            opponents: [.mock(id: id), .mock(id: id+1)],
            serie: .mock()
        )
    }
}

extension League {
    static func mock() -> League {
        .init(image: "", name: "League name")
    }
}

extension Opponents {
    static func mock(id: Int) -> Opponents {
        .init(team: .mock(id: id))
    }
}

extension Serie {
    static func mock() -> Serie {
        .init(name: "Serie name")
    }
}
