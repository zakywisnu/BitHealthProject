//
//  MealsEndpointTests.swift
//  BitHealthProjectTests
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import XCTest
import BitHealthProject

struct MealsEndpoint: APIEndpoint {
    private let letter: String
    
    init(letter: String) {
        self.letter = letter
    }
    
    var baseURL: URL {
        Constants.baseURL
    }
    
    var path: String {
        "/json/v1/1/search.php"
    }
    
    var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "f", value: letter)]
    }
    
    var method: BitHealthProject.HTTPMethod {
        .GET
    }
}

final class MealsEndpointTests: XCTestCase {

    func test_meals_endpointURL() {
        let baseURL = URL(string: "https://www.themealdb.com/api")
        let letter = "a"
        let received = MealsEndpoint(letter: letter).makeURLRequest()
        let expected = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=a")!
        
        XCTAssertEqual(received.url, expected)
    }
}
