//
//  Match+Mock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV

extension Match {
    static func mock(id: Int) -> Match {
        .init(
            id: id,
            league: .mock(),
            status: .finished,
            opponents: [.mock()],
            serie: .mock()
        )
    }
}

extension League {
    static func mock() -> League {
        .init(image: "", name: "")
    }
}

extension Opponents {
    static func mock() -> Opponents {
        .init(team: .mock())
    }
}

extension Serie {
    static func mock() -> Serie {
        .init(name: "")
    }
}
