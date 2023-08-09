//
//  URLSessionMock.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV
import Foundation

final class URLSessionMock: URLSessionProtocol {
    private(set) var request: URLRequest?
    var responseStatusCode: Int = 200
    
    func data(for request: URLRequest, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        self.request = request
        let response: URLResponse = HTTPURLResponse(url: request.url!, statusCode: responseStatusCode, httpVersion: nil, headerFields: nil)!
        return ("data".data(using: .utf8)!, response)
    }
}
