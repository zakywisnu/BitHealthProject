//
//  MealsMapperTests.swift
//  BitHealthProjectTests
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import XCTest
import BitHealthProject

enum MealsMapper {
    private struct Root: Decodable {
        private let meals: [Item]
        
        private struct Item: Decodable {
            let idMeal: String?
            let strMeal: String?
            let strCategory: String?
            let strInstructions: String?
            let strMealThumb: String?
            let strYoutube: String?
            let strIngredient1: String?
            let strIngredient2: String?
            let strIngredient3: String?
            let strIngredient4: String?
            let strIngredient5: String?
            let strIngredient6: String?
            let strIngredient7: String?
            let strIngredient8: String?
            let strIngredient9: String?
            let strIngredient10: String?
            let strIngredient11: String?
            let strIngredient12: String?
            let strIngredient13: String?
            let strIngredient14: String?
            let strIngredient15: String?
            let strIngredient16: String?
            let strIngredient17: String?
            let strIngredient18: String?
            let strIngredient19: String?
            let strIngredient20: String?
            let strMeasure1: String?
            let strMeasure2: String?
            let strMeasure3: String?
            let strMeasure4: String?
            let strMeasure5: String?
            let strMeasure6: String?
            let strMeasure7: String?
            let strMeasure8: String?
            let strMeasure9: String?
            let strMeasure10: String?
            let strMeasure11: String?
            let strMeasure12: String?
            let strMeasure13: String?
            let strMeasure14: String?
            let strMeasure15: String?
            let strMeasure16: String?
            let strMeasure17: String?
            let strMeasure18: String?
            let strMeasure19: String?
            let strMeasure20: String?

            enum CodingKeys: String, CodingKey {
                case idMeal = "idMeal"
                case strMeal = "strMeal"
                case strCategory = "strCategory"
                case strInstructions = "strInstructions"
                case strMealThumb = "strMealThumb"
                case strYoutube = "strYoutube"
                case strIngredient1 = "strIngredient1"
                case strIngredient2 = "strIngredient2"
                case strIngredient3 = "strIngredient3"
                case strIngredient4 = "strIngredient4"
                case strIngredient5 = "strIngredient5"
                case strIngredient6 = "strIngredient6"
                case strIngredient7 = "strIngredient7"
                case strIngredient8 = "strIngredient8"
                case strIngredient9 = "strIngredient9"
                case strIngredient10 = "strIngredient10"
                case strIngredient11 = "strIngredient11"
                case strIngredient12 = "strIngredient12"
                case strIngredient13 = "strIngredient13"
                case strIngredient14 = "strIngredient14"
                case strIngredient15 = "strIngredient15"
                case strIngredient16 = "strIngredient16"
                case strIngredient17 = "strIngredient17"
                case strIngredient18 = "strIngredient18"
                case strIngredient19 = "strIngredient19"
                case strIngredient20 = "strIngredient20"
                case strMeasure1 = "strMeasure1"
                case strMeasure2 = "strMeasure2"
                case strMeasure3 = "strMeasure3"
                case strMeasure4 = "strMeasure4"
                case strMeasure5 = "strMeasure5"
                case strMeasure6 = "strMeasure6"
                case strMeasure7 = "strMeasure7"
                case strMeasure8 = "strMeasure8"
                case strMeasure9 = "strMeasure9"
                case strMeasure10 = "strMeasure10"
                case strMeasure11 = "strMeasure11"
                case strMeasure12 = "strMeasure12"
                case strMeasure13 = "strMeasure13"
                case strMeasure14 = "strMeasure14"
                case strMeasure15 = "strMeasure15"
                case strMeasure16 = "strMeasure16"
                case strMeasure17 = "strMeasure17"
                case strMeasure18 = "strMeasure18"
                case strMeasure19 = "strMeasure19"
                case strMeasure20 = "strMeasure20"
            }
        }
        
        var mealsList: [Meals] {
            meals.map {
                Meals(
                    idMeal: $0.idMeal ?? "",
                    strMeal: $0.strMeal ?? "",
                    strCategory: $0.strCategory ?? "",
                    strInstructions: $0.strInstructions ?? "",
                    strMealThumb: $0.strMealThumb ?? "",
                    strYoutube: $0.strYoutube ?? "",
                    strIngredient1: $0.strIngredient1 ?? "",
                    strIngredient2: $0.strIngredient2 ?? "",
                    strIngredient3: $0.strIngredient3 ?? "",
                    strIngredient4: $0.strIngredient4 ?? "",
                    strIngredient5: $0.strIngredient5 ?? "",
                    strIngredient6: $0.strIngredient6 ?? "",
                    strIngredient7: $0.strIngredient7 ?? "",
                    strIngredient8: $0.strIngredient8 ?? "",
                    strIngredient9: $0.strIngredient9 ?? "",
                    strIngredient10: $0.strIngredient10 ?? "",
                    strIngredient11: $0.strIngredient11 ?? "",
                    strIngredient12: $0.strIngredient12 ?? "",
                    strIngredient13: $0.strIngredient13 ?? "",
                    strIngredient14: $0.strIngredient14 ?? "",
                    strIngredient15: $0.strIngredient15 ?? "",
                    strIngredient16: $0.strIngredient16 ?? "",
                    strIngredient17: $0.strIngredient17 ?? "",
                    strIngredient18: $0.strIngredient18 ?? "",
                    strIngredient19: $0.strIngredient19 ?? "",
                    strIngredient20: $0.strIngredient20 ?? "",
                    strMeasure1: $0.strMeasure1 ?? "",
                    strMeasure2: $0.strMeasure2 ?? "",
                    strMeasure3: $0.strMeasure3 ?? "",
                    strMeasure4: $0.strMeasure4 ?? "",
                    strMeasure5: $0.strMeasure5 ?? "",
                    strMeasure6: $0.strMeasure6 ?? "",
                    strMeasure7: $0.strMeasure7 ?? "",
                    strMeasure8: $0.strMeasure8 ?? "",
                    strMeasure9: $0.strMeasure9 ?? "",
                    strMeasure10: $0.strMeasure10 ?? "",
                    strMeasure11: $0.strMeasure11 ?? "",
                    strMeasure12: $0.strMeasure12 ?? "",
                    strMeasure13: $0.strMeasure13 ?? "",
                    strMeasure14: $0.strMeasure14 ?? "",
                    strMeasure15: $0.strMeasure15 ?? "",
                    strMeasure16: $0.strMeasure16 ?? "",
                    strMeasure17: $0.strMeasure17 ?? "",
                    strMeasure18: $0.strMeasure18 ?? "",
                    strMeasure19: $0.strMeasure19 ?? "",
                    strMeasure20: $0.strMeasure20 ?? ""
                )
            }
        }
    }
    
    enum Error: Swift.Error {
        case invalidData
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [Meals] {
        let decoder = JSONDecoder()
        
        guard response.isOK2xx, let root = try? decoder.decode(Root.self, from: data) else {
            throw Error.invalidData
        }
        
        return root.mealsList
    }
}

struct Meals {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let strYoutube: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
}

final class MealsMapperTests: XCTestCase {
    
    func test_map_throwsErrorOnNon2xxHTTPResponse() throws {
        let json = makeItemsJSON([])
        let samplesCode = [150, 199, 300, 400, 500]
        
        try samplesCode.forEach { code in
            XCTAssertThrowsError(
                try MealsMapper.map(json, from: HTTPURLResponse(statusCode: code))
            )
        }
    }
    
    func test_map_throwsErrorOn2xxHTTPResponseWithInvalidJSON() throws {
        let invalidJSON = Data("invalid json".utf8)

        try validStatusCode.forEach { code in
            XCTAssertThrowsError(
                try MealsMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: code))
            )
        }
    }

    // MARK: - Helpers
    
    private func makeItemsJSON(_ items: [[String: Any]]) -> Data {
        let json = ["meals": items]
        return try! JSONSerialization.data(withJSONObject: json)
    }
    
    private var validStatusCode: [Int] {
        return [200, 201, 250, 289, 299]
    }

}
