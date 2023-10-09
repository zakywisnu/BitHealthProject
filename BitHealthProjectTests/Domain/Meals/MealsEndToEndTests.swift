//
//  MealsEndToEndTests.swift
//  BitHealthProjectTests
//
//  Created by Ahmad Zaky W on 09/10/23.
//

import XCTest
import BitHealthProject
import Alamofire

final class MealsEndToEndTests: XCTestCase {
    
    func test_endToEndTestServerMealsResult_matchesFixedTestMealsData() {
        switch getMealsResult() {
        case let .success(meals):
            XCTAssertEqual(meals.count, 4, "expected 4 items in the list")
            XCTAssertEqual(meals[0], expectedItem(at: 0))
            XCTAssertEqual(meals[1], expectedItem(at: 1))
            XCTAssertEqual(meals[2], expectedItem(at: 2))
            XCTAssertEqual(meals[3], expectedItem(at: 3))
        case let .failure(error):
            XCTFail("Expected successful meals result, got \(error) instead")
        default:
            XCTFail("Expected successful meals result, got no result instead")
        }
    }
    
    // MARK: - Helpers
    typealias MealsResult = Result<[Meals], Error>
    
    private func getMealsResult(file: StaticString = #file, line: UInt = #line) -> MealsResult? {
        let testServerEndpoint = MealsEndpoint(letter: "a").makeURLRequest()
        let client = AlamofireHTTPClient(session: Session.default)
        let interactor = MealsInteractor(httpClient: client)
        trackForMemoryLeaks(client, file: file, line: line)
        trackForMemoryLeaks(interactor, file: file, line: line)
        
        let exp = expectation(description: "Wait for result")
        
        var receivedResult: MealsResult?
        interactor.loadMeals(request: testServerEndpoint) { result in
            receivedResult = result
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
        return receivedResult
    }
}
