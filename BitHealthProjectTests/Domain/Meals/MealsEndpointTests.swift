//
//  MealsEndpointTests.swift
//  BitHealthProjectTests
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import XCTest
import BitHealthProject

final class MealsEndpointTests: XCTestCase {

    func test_meals_endpointURL() {
        let letter = "a"
        let received = MealsEndpoint(letter: letter).makeURLRequest()
        let expected = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=a")!
        
        XCTAssertEqual(received.url, expected)
    }
}
