//
//  DetailMealsEndToEndTests.swift
//  BitHealthProjectTests
//
//  Created by Ahmad Zaky W on 09/10/23.
//

import XCTest
import BitHealthProject
import Alamofire

final class DetailMealsEndToEndTests: XCTestCase {
    
    func test_endToEndTestServerDetailResult_matchesFixedTestDetailMealData() {
        switch getMealsResult() {
        case let .success(meals):
            XCTAssertEqual(meals.idMeal, idMeal(at: 0))
            XCTAssertEqual(meals.strMeal, strMeal(at: 0))
            XCTAssertEqual(meals.strCategory, category(at: 0))
            XCTAssertEqual(meals.strInstructions, getInstruction(at: 0))
            XCTAssertEqual(meals.strMealThumb, mealThumb(at: 0))
            XCTAssertEqual(meals.strYoutube, youtube(at: 0))
            XCTAssertEqual(meals.strIngredientMeasure1, ingredient1(at: 0))
            XCTAssertEqual(meals.strIngredientMeasure2, ingredient2(at: 0))
        case let .failure(error):
            XCTFail("Expected successful meals result, got \(error) instead")
        default:
            XCTFail("Expected successful meals result, got no result instead")
        }
    }
    
    // MARK: - Helpers
    typealias MealsResult = Result<Meals, Error>
    
    private func getMealsResult(file: StaticString = #file, line: UInt = #line) -> MealsResult? {
        let testServerEndpoint = DetailMealsEndpoint(id: "52768").makeURLRequest()
        let client = AlamofireHTTPClient(session: Session.default)
        let interactor = DetailMealsInteractor(httpClient: client)
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
