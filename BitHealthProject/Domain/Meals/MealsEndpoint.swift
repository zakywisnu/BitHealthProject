//
//  MealsEndpoint.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

public struct MealsEndpoint: APIEndpoint {
    private let letter: String
    
    public init(letter: String) {
        self.letter = letter
    }
    
    public var baseURL: URL {
        Constants.baseURL
    }
    
    public var path: String {
        "/json/v1/1/search.php"
    }
    
    public var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "f", value: letter)]
    }
    
    public var method: BitHealthProject.HTTPMethod {
        .GET
    }
}
