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
    public var token = "Bearer " + Constants.API_ACCESS_TOKEN
    public static var shared: APIConfig = .init()
    private init() {}
}
