//
//  APIConfig.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

public protocol APIConfigProtocol {
    var basePath: String { get }
    var token: String { get }
}

public final class APIConfig: APIConfigProtocol {
    public var basePath = "https://api.pandascore.co/csgo"
    public var token = "Bearer WsqUL324qe_uJX7zC9xwH8yBM1bgh_XN80N0GMmgsRwo-tLW17Y"
    public static var shared: APIConfig = .init()
    private init() {}
}
