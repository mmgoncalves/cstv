//
//  NetworkError.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

public enum NetworkError: Int, Error {
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case serverError = 500
    case undefined = 0
    case parse = 9999
    case endpointNotExist = -1
}
