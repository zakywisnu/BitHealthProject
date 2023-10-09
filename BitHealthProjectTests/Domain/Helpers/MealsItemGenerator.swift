//
//  MealsItemGenerator.swift
//  BitHealthProjectTests
//
//  Created by Ahmad Zaky W on 09/10/23.
//

import Foundation
import BitHealthProject

func expectedItem(at index: Int) -> Meals {
    return Meals(
        idMeal: idMeal(at: index),
        strMeal: strMeal(at: index),
        strCategory: category(at: index),
        strInstructions: getInstruction(at: index),
        strMealThumb: mealThumb(at: index),
        strYoutube: youtube(at: index),
        strIngredientMeasure1: ingredient1(at: index),
        strIngredientMeasure2: ingredient2(at: index),
        strIngredientMeasure3: ingredient3(at: index),
        strIngredientMeasure4: ingredient4(at: index),
        strIngredientMeasure5: ingredient5(at: index),
        strIngredientMeasure6: ingredient6(at: index),
        strIngredientMeasure7: ingredient7(at: index),
        strIngredientMeasure8: ingredient8(at: index),
        strIngredientMeasure9: ingredient9(at: index),
        strIngredientMeasure10: ingredient10(at: index),
        strIngredientMeasure11: ingredient11(at: index),
        strIngredientMeasure12: ingredient12(at: index),
        strIngredientMeasure13: ingredient13(at: index),
        strIngredientMeasure14: "",
        strIngredientMeasure15: "",
        strIngredientMeasure16: "",
        strIngredientMeasure17: "",
        strIngredientMeasure18: "",
        strIngredientMeasure19: "",
        strIngredientMeasure20: ""
    )
}

func idMeal(at index: Int) -> String {
    let ids: [String] = [
        "52768",
        "52893",
        "53049",
        "53050"
    ]
    return ids[index]
}

func strMeal(at index: Int) -> String {
    let meals: [String] = [
        "Apple Frangipan Tart",
        "Apple & Blackberry Crumble",
        "Apam balik",
        "Ayam Percik",
    ]
    return meals[index]
}

func category(at index: Int) -> String {
    let categories: [String] = [
        "Dessert",
        "Dessert",
        "Dessert",
        "Chicken",
    ]
    return categories[index]
}

func mealThumb(at index: Int) -> String {
    let images: [String] = [
        "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
        "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
        "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
        "https://www.themealdb.com/images/media/meals/020z181619788503.jpg"
    ]
    
    return images[index]
}

func youtube(at index: Int) -> String {
    let urls: [String] = [
        "https://www.youtube.com/watch?v=rp8Slv4INLk",
        "https://www.youtube.com/watch?v=4vhcOwVBDO4",
        "https://www.youtube.com/watch?v=6R8ffRRJcrg",
        "https://www.youtube.com/watch?v=9ytR28QK6I8"
    ]
    return urls[index]
}

func ingredient1(at index: Int) -> String {
    let ingredient: [String] = [
        "digestive biscuits - 175g/6oz",
        "Plain Flour - 120g",
        "Milk - 200ml",
        "Chicken Thighs - 6"
    ]
    
    return ingredient[index]
}

func ingredient2(at index: Int) -> String {
    let ingredient: [String] = [
        "butter - 75g/3oz",
        "Caster Sugar - 60g",
        "Oil - 60ml",
        "Challots - 16"
    ]
    
    return ingredient[index]
}

func ingredient3(at index: Int) -> String {
    let ingredient: [String] = [
        "Bramley apples - 200g/7oz",
        "Butter - 60g",
        "Eggs - 2",
        "Ginger - 1 1/2 "
    ]
    
    return ingredient[index]
}

func ingredient4(at index: Int) -> String {
    let ingredient: [String] = [
        "butter, softened - 75g/3oz",
        "Braeburn Apples - 300g",
        "Flour - 1600g",
        "Garlic Clove - 6"
    ]
    
    return ingredient[index]
}

func ingredient5(at index: Int) -> String {
    let ingredient: [String] = [
        "caster sugar - 75g/3oz",
        "Butter - 30g",
        "Baking Powder - 3 tsp",
        "Cayenne Pepper - 8"
    ]
    
    return ingredient[index]
}

func ingredient6(at index: Int) -> String {
    let ingredient: [String] = [
        "free-range eggs, beaten - 2",
        "Demerara Sugar - 30g",
        "Salt - 1/2 tsp",
        "Turmeric - 2 tbs"
    ]
    
    return ingredient[index]
}

func ingredient7(at index: Int) -> String {
    let ingredient: [String] = [
        "ground almonds - 75g/3oz",
        "Blackberrys - 120g",
        "Unsalted Butter - 25g",
        "Cumin - 1 1/2 "
    ]
    
    return ingredient[index]
}

func ingredient8(at index: Int) -> String {
    let ingredient: [String] = [
        "almond extract - 1 tsp",
        "Cinnamon - ¼ teaspoon",
        "Sugar - 45g",
        "Coriander - 1 1/2 "
    ]
    
    return ingredient[index]
}

func ingredient9(at index: Int) -> String {
    let ingredient: [String] = [
        "flaked almonds - 50g/1¾oz",
        "Ice Cream - to serve",
        "Peanut Butter - 3 tbs",
        "Fennel - 1 1/2 "
    ]
    
    return ingredient[index]
}

func ingredient10(at index: Int) -> String {
    let ingredient: [String] = [
        "",
        "",
        "",
        "Tamarind Paste - 2 tbs"
    ]
    
    return ingredient[index]
}

func ingredient11(at index: Int) -> String {
    let ingredient: [String] = [
        "",
        "",
        "",
        "Coconut Milk - 1 can "
    ]
    
    return ingredient[index]
}

func ingredient12(at index: Int) -> String {
    let ingredient: [String] = [
        "",
        "",
        "",
        "Sugar - 1 tsp "
    ]
    
    return ingredient[index]
}

func ingredient13(at index: Int) -> String {
    let ingredient: [String] = [
        "",
        "",
        "",
        "Water - 1 cup "
    ]
    
    return ingredient[index]
}

func getInstruction(at index: Int) -> String {
    let intructionList: [String] = [
        """
        Preheat the oven to 200C/180C Fan/Gas 6.\r\nPut the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.\r\nCream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.\r\nPeel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.\r\nBake for 20-25 minutes until golden-brown and set.\r\nRemove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.\r\nTransfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream.
        """,
        """
        Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.
        """,
        """
        Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.
        """,
        """
        In a blender, add the ingredients for the spice paste and blend until smooth.\r\nOver medium heat, pour the spice paste in a skillet or pan and fry for 10 minutes until fragrant. Add water or oil 1 tablespoon at a time if the paste becomes too dry. Don\'t burn the paste. Lower the fire slightly if needed.\r\nAdd the cloves, cardamom, tamarind pulp, coconut milk, water, sugar and salt. Turn the heat up and bring the mixture to boil. Turn the heat to medium low and simmer for 10 minutes. Stir occasionally. It will reduce slightly. This is the marinade/sauce, so taste and adjust seasoning if necessary. Don\'t worry if it\'s slightly bitter. It will go away when roasting.\r\nWhen the marinade/sauce has cooled, pour everything over the chicken and marinate overnight to two days.\r\nPreheat the oven to 425 F.\r\nRemove the chicken from the marinade. Spoon the marinade onto a greased (or aluminum lined) baking sheet. Lay the chicken on top of the sauce (make sure the chicken covers the sauce and the sauce isn\'t exposed or it\'ll burn) and spread the remaining marinade on the chicken. Roast for 35-45 minutes or until internal temp of the thickest part of chicken is at least 175 F.\r\nLet chicken rest for 5 minutes. Brush the chicken with some of the oil. Serve chicken with the sauce over steamed rice (or coconut rice).
        """
    ]
    
    return intructionList[index]
}
