//
//  EndpointMock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV
import Foundation

final class EndpointMock: Endpoint {
    var path: String = "/endpointMock"
    var method: ResquestMethod = .get
    var queryParams: [URLQueryItem] = [
        .init(name: "key", value: "value")
    ]
}
