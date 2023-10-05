//
//  AlamofireHTTPClientTests.swift
//  BitHealthProjectTests
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import XCTest
import BitHealthProject
import Alamofire

final class AlamofireHTTPClientTests: XCTestCase {

    override func tearDown() {
        super.tearDown()
        
        URLProtocolStub.removeStub()
    }
    
    func test_getFromURL_performGetRequestWithURL() {
        let url = Self.anyURL()
        
        let exp = expectation(description: "Wait for request")
        
        URLProtocolStub.observeRequests { request in
            XCTAssertEqual(request.url, url)
            XCTAssertEqual(request.httpMethod, "GET")
            exp.fulfill()
        }
        let request = MockAPIEndpoint().makeURLRequest()
        makeSUT().performRequest(request) { _ in }
        
        wait(for: [exp], timeout: 1.0)
    }

    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> HTTPClient {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = AlamofireHTTPClient(session: Session(configuration: configuration))
        return session
    }
    
    private static func anyURL() -> URL {
        return URL(string: "https://any-url.com")!
    }
    
    private func anyNSError() -> Error {
        return NSError(domain: "any error", code: 0)
    }
    
    private func resultValuesFor(_ values: (data: Data?, response: URLResponse?, error: Error?), request: URLRequest = MockAPIEndpoint().makeURLRequest(), file: StaticString = #filePath, line: UInt = #line) -> (data: Data, response: HTTPURLResponse)? {
        let result = resultFor(values, request: request, file: file, line: line)

        switch result {
        case let .success(values):
            return values
        default:
            XCTFail("Expected success, got \(result) instead", file: file, line: line)
            return nil
        }
    }

    private func resultErrorFor(_ values: (data: Data?, response: URLResponse?, error: Error?)? = nil, request: URLRequest = MockAPIEndpoint().makeURLRequest(), file: StaticString = #filePath, line: UInt = #line) -> Error? {
        let result = resultFor(values, request: request, file: file, line: line)

        switch result {
        case let .failure(error):
            return error
        default:
            XCTFail("Expected failure, got \(result) instead", file: file, line: line)
            return nil
        }
    }

    private func resultFor(_ values: (data: Data?, response: URLResponse?, error: Error?)?, request: URLRequest, file: StaticString = #filePath, line: UInt = #line) -> HTTPClient.Result {
        values.map { URLProtocolStub.stub(data: $0, response: $1, error: $2) }

        let sut = makeSUT(file: file, line: line)
        let exp = expectation(description: "Wait for completion")

        var receivedResult: HTTPClient.Result!
        sut.performRequest(request) { result in
            receivedResult = result
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1.0)
        return receivedResult
    }
    
    private struct MockAPIEndpoint: APIEndpoint {
        var baseURL: URL {
            return AlamofireHTTPClientTests.anyURL()
        }
        
        var path: String {
            ""
        }
        
        var method: BitHealthProject.HTTPMethod {
            .GET
        }
    }
    
    private func anyHTTPURLResponse() -> HTTPURLResponse {
        return HTTPURLResponse(url: Self.anyURL(), statusCode: 200, httpVersion: nil, headerFields: nil)!
    }

    private func nonHTTPURLResponse() -> URLResponse {
        return URLResponse(url: Self.anyURL(), mimeType: nil, expectedContentLength: 0, textEncodingName: nil)
    }
    
    private func anyData() -> Data {
        return Data("any data".utf8)
    }
}
