//
//  DetailMealsEndpointTests.swift
//  BitHealthProjectTests
//
//  Created by Ahmad Zaky W on 08/10/23.
//

import XCTest
import BitHealthProject

final class DetailMealsEndpointTests: XCTestCase {

    func test_detailMeals_endpointURL() {
        let id = "52772"
        let received = DetailMealsEndpoint(id: id).makeURLRequest()
        let expected = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        
        XCTAssertEqual(received.url, expected)
    }
}
