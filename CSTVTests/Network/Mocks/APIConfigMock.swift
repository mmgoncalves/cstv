//
//  APIConfigMock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV

final class APIConfigMock: APIConfigProtocol {
    var basePath: String = "basePathMock"
    var token: String = "tokenMock"
}
