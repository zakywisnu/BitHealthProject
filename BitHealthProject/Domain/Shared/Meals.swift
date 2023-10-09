//
//  Meals.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

public struct Meals: Equatable {
    public init(idMeal: String, strMeal: String, strCategory: String, strInstructions: String, strMealThumb: String, strYoutube: String, strIngredientMeasure1: String, strIngredientMeasure2: String, strIngredientMeasure3: String, strIngredientMeasure4: String, strIngredientMeasure5: String, strIngredientMeasure6: String, strIngredientMeasure7: String, strIngredientMeasure8: String, strIngredientMeasure9: String, strIngredientMeasure10: String, strIngredientMeasure11: String, strIngredientMeasure12: String, strIngredientMeasure13: String, strIngredientMeasure14: String, strIngredientMeasure15: String, strIngredientMeasure16: String, strIngredientMeasure17: String, strIngredientMeasure18: String, strIngredientMeasure19: String, strIngredientMeasure20: String) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strCategory = strCategory
        self.strInstructions = strInstructions
        self.strMealThumb = strMealThumb
        self.strYoutube = strYoutube
        self.strIngredientMeasure1 = strIngredientMeasure1
        self.strIngredientMeasure2 = strIngredientMeasure2
        self.strIngredientMeasure3 = strIngredientMeasure3
        self.strIngredientMeasure4 = strIngredientMeasure4
        self.strIngredientMeasure5 = strIngredientMeasure5
        self.strIngredientMeasure6 = strIngredientMeasure6
        self.strIngredientMeasure7 = strIngredientMeasure7
        self.strIngredientMeasure8 = strIngredientMeasure8
        self.strIngredientMeasure9 = strIngredientMeasure9
        self.strIngredientMeasure10 = strIngredientMeasure10
        self.strIngredientMeasure11 = strIngredientMeasure11
        self.strIngredientMeasure12 = strIngredientMeasure12
        self.strIngredientMeasure13 = strIngredientMeasure13
        self.strIngredientMeasure14 = strIngredientMeasure14
        self.strIngredientMeasure15 = strIngredientMeasure15
        self.strIngredientMeasure16 = strIngredientMeasure16
        self.strIngredientMeasure17 = strIngredientMeasure17
        self.strIngredientMeasure18 = strIngredientMeasure18
        self.strIngredientMeasure19 = strIngredientMeasure19
        self.strIngredientMeasure20 = strIngredientMeasure20
    }
    
    public let idMeal: String
    public let strMeal: String
    public let strCategory: String
    public let strInstructions: String
    public let strMealThumb: String
    public let strYoutube: String
    public let strIngredientMeasure1: String
    public let strIngredientMeasure2: String
    public let strIngredientMeasure3: String
    public let strIngredientMeasure4: String
    public let strIngredientMeasure5: String
    public let strIngredientMeasure6: String
    public let strIngredientMeasure7: String
    public let strIngredientMeasure8: String
    public let strIngredientMeasure9: String
    public let strIngredientMeasure10: String
    public let strIngredientMeasure11: String
    public let strIngredientMeasure12: String
    public let strIngredientMeasure13: String
    public let strIngredientMeasure14: String
    public let strIngredientMeasure15: String
    public let strIngredientMeasure16: String
    public let strIngredientMeasure17: String
    public let strIngredientMeasure18: String
    public let strIngredientMeasure19: String
    public let strIngredientMeasure20: String
    
    public var ingredients: [String] {
        let ingredientsMeasures = [
            strIngredientMeasure1,
            strIngredientMeasure2,
            strIngredientMeasure3,
            strIngredientMeasure4,
            strIngredientMeasure5,
            strIngredientMeasure6,
            strIngredientMeasure7,
            strIngredientMeasure8,
            strIngredientMeasure9,
            strIngredientMeasure10,
            strIngredientMeasure11,
            strIngredientMeasure12,
            strIngredientMeasure13,
            strIngredientMeasure14,
            strIngredientMeasure15,
            strIngredientMeasure16,
            strIngredientMeasure17,
            strIngredientMeasure18,
            strIngredientMeasure19,
            strIngredientMeasure20
        ]
        
        return ingredientsMeasures.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
    }
}
