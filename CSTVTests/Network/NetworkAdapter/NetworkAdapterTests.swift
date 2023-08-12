//
//  NetworkAdapterTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV
import XCTest

final class NetworkAdapterTests: XCTestCase {
    private var sut: NetworkAdapter!
    private var apiConfigMock: APIConfigMock!
    private var urlSessionMock: URLSessionMock!
    
    override func setUp() {
        super.setUp()
        apiConfigMock = .init()
        urlSessionMock = .init()
        sut = .init(apiConfig: apiConfigMock, urlSession: urlSessionMock)
    }
    
    func testRequest() async {
        // - given
        let endpointMock = EndpointMock()
        let expectedURL = apiConfigMock.basePath + endpointMock.path + "?\(endpointMock.queryParams.first?.name ?? "")=\(endpointMock.queryParams.first?.value ?? "")"
        
        // - when
        _ = await sut.request(endpoint: endpointMock)
        
        // - then
        let header = urlSessionMock.request?.allHTTPHeaderFields?["Authorization"]
        let httpMethod = urlSessionMock.request?.httpMethod
        let url = urlSessionMock.request?.url?.absoluteString
        XCTAssertEqual(header, apiConfigMock.token)
        XCTAssertEqual(httpMethod, ResquestMethod.get.rawValue)
        XCTAssertEqual(url, expectedURL)
    }
    
    func testFailRequest() async {
        // - given
        let endpointMock = EndpointMock()
        urlSessionMock.responseStatusCode = 400
        
        // - when
        let response = await sut.request(endpoint: endpointMock)
        
        // - then
        switch response {
        case .success:
            XCTFail("should not be success")
        case .failure(let networkError):
            XCTAssertEqual(networkError, NetworkError.badRequest)
        }
    }
}
