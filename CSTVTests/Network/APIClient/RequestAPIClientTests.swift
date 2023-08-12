//
//  RequestAPIClientTests.swift
//  CSTVTests
//
//  Created by Mateus Marques on 09/08/23.
//

@testable import CSTV
import XCTest

final class RequestAPIClientTests: XCTestCase {
    private var sut: RequestAPIClient!
    private var networkAdapterMock: NetworkAdapterMock!
    
    override func setUp() {
        super.setUp()
        networkAdapterMock = .init()
        sut = .init(networkAdapter: networkAdapterMock)
    }
    
    func testRequest() async {
        // - givin
        let endpointMock = EndpointMock()
        let data = try! JSONEncoder().encode(CodableMock())
        networkAdapterMock.response = .success(data)
        
        // - when
        let response: Result<CodableMock> = await sut.request(endpointMock)
        
        // - then
        switch response {
        case .success(let codableMock):
            XCTAssertEqual(codableMock.value, "value")
        case .failure:
            XCTFail("should not fail")
        }
    }
    
    func testParseErrorRequest() async {
        // - givin
        let endpointMock = EndpointMock()
        let data = "data".data(using: .utf8)!
        networkAdapterMock.response = .success(data)
        
        // - when
        let response: Result<CodableMock> = await sut.request(endpointMock)
        
        // - then
        switch response {
        case .success:
            XCTFail("should not be success")
        case .failure(let networkError):
            XCTAssertEqual(networkError, NetworkError.parse)
        }
    }
}
