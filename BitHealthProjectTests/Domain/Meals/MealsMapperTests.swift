//
//  MealsMapperTests.swift
//  BitHealthProjectTests
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import XCTest
import BitHealthProject

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
    
    func test_map_deliversNoItemsOn2xxHTTPResponseWithEmptyJSONList() throws {
        let emptyListJSON = makeItemsJSON([])
        
        try validStatusCode.forEach { code in
            let result = try MealsMapper.map(emptyListJSON, from: HTTPURLResponse(statusCode: code))
            XCTAssertEqual(result, [])
        }
    }
    
    func test_map_deliversItemsOn2xxHTTPResponseWithJSONItems() throws {
        let item1 = makeItem(
            idMeal: UUID().uuidString,
            strMeal: "any meal",
            strCategory: "any category",
            strInstructions: "this is meal instructions",
            strMealThumb: "https://any-meal.com/image.png",
            strYoutube: "https://any-youtube.com",
            strIngredient1: "ingredient 1",
            strIngredient2: "ingredient 2",
            strIngredient3: "ingredient 3",
            strIngredient4: "ingredient 4",
            strMeasure1: "measure 1",
            strMeasure2: "measure 2",
            strMeasure3: "measure 3",
            strMeasure4: "measure 4"
        )

        let json = makeItemsJSON([item1.json])

        try validStatusCode.forEach { code in
            let result = try MealsMapper.map(json, from: HTTPURLResponse(statusCode: code))
            XCTAssertEqual(result, [item1.model])
        }
    }
    
    // MARK: - Helpers
    
    private func makeItemsJSON(_ items: [[String: Any]]) -> Data {
        let json = ["meals": items]
        return try! JSONSerialization.data(withJSONObject: json)
    }
    
    private func makeItem(
        idMeal: String,
        strMeal: String,
        strCategory: String,
        strInstructions: String,
        strMealThumb: String,
        strYoutube: String,
        strIngredient1: String,
        strIngredient2: String,
        strIngredient3: String,
        strIngredient4: String,
        strMeasure1: String,
        strMeasure2: String,
        strMeasure3: String,
        strMeasure4: String
    ) -> (model: Meals, json: [String: Any]) {
        let item = Meals(
            idMeal: idMeal,
            strMeal: strMeal,
            strCategory: strCategory,
            strInstructions: strInstructions,
            strMealThumb: strMealThumb,
            strYoutube: strYoutube,
            strIngredientMeasure1: combineIngredientsWithMeasure(ingredient: strIngredient1, measure: strMeasure1),
            strIngredientMeasure2: combineIngredientsWithMeasure(ingredient: strIngredient2, measure: strMeasure2),
            strIngredientMeasure3: combineIngredientsWithMeasure(ingredient: strIngredient3, measure: strMeasure3),
            strIngredientMeasure4: combineIngredientsWithMeasure(ingredient: strIngredient4, measure: strMeasure4),
            strIngredientMeasure5: combineIngredientsWithMeasure(ingredient: "", measure: ""),
            strIngredientMeasure6: combineIngredientsWithMeasure(ingredient: nil, measure: nil),
            strIngredientMeasure7: "",
            strIngredientMeasure8: "",
            strIngredientMeasure9: "",
            strIngredientMeasure10: "",
            strIngredientMeasure11: "",
            strIngredientMeasure12: "",
            strIngredientMeasure13: "",
            strIngredientMeasure14: "",
            strIngredientMeasure15: "",
            strIngredientMeasure16: "",
            strIngredientMeasure17: "",
            strIngredientMeasure18: "",
            strIngredientMeasure19: "",
            strIngredientMeasure20: ""
        )
        
        let json: [String: Any] = [
            "idMeal": idMeal,
            "strMeal": strMeal,
            "strDrinkAlternate": "",
            "strCategory": strCategory,
            "strArea": "British",
            "strInstructions": strInstructions,
            "strMealThumb": strMealThumb,
            "strTags": "Pudding",
            "strYoutube": strYoutube,
            "strIngredient1": strIngredient1,
            "strIngredient2": strIngredient2,
            "strIngredient3": strIngredient3,
            "strIngredient4": strIngredient4,
            "strIngredient5": " ",
            "strIngredient6": " ",
            "strIngredient7": "",
            "strIngredient8": "",
            "strIngredient9": "",
            "strIngredient10": "",
            "strIngredient11": "",
            "strIngredient12": "",
            "strIngredient13": "",
            "strIngredient14": "",
            "strIngredient15": "",
            "strIngredient16": "",
            "strIngredient17": "",
            "strIngredient18": "",
            "strIngredient19": "",
            "strIngredient20": "",
            "strMeasure1": strMeasure1,
            "strMeasure2": strMeasure2,
            "strMeasure3": strMeasure3,
            "strMeasure4": strMeasure4,
            "strMeasure5": " ",
            "strMeasure6": " ",
            "strMeasure7": "",
            "strMeasure8": "",
            "strMeasure9": "",
            "strMeasure10": "",
            "strMeasure11": "",
            "strMeasure12": "",
            "strMeasure13": "",
            "strMeasure14": "",
            "strMeasure15": "",
            "strMeasure16": "",
            "strMeasure17": "",
            "strMeasure18": "",
            "strMeasure19": "",
            "strMeasure20": "",
            "strSource": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
            "strImageSource": "",
            "strCreativeCommonsConfirmed": "",
            "dateModified": ""
        ]
        
        return (item, json)
    }
    
    private var validStatusCode: [Int] {
        return [200, 201, 250, 289, 299]
    }
    
    private func combineIngredientsWithMeasure(ingredient: String?, measure: String?) -> String {
        guard let ingredient = ingredient, let measure = measure else { return "" }
        if ingredient.trimmingCharacters(in: .whitespaces).isEmpty && measure.trimmingCharacters(in: .whitespaces).isEmpty {
            return ""
        } else {
            return "\(ingredient) - \(measure)"
        }
    }
    
}
