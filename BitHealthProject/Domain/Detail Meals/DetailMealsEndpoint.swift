//
//  DetailEndpoint.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 08/10/23.
//

import Foundation

public struct DetailMealsEndpoint: APIEndpoint {
    private let id: String
    
    public init(id: String) {
        self.id = id
    }
    
    public var baseURL: URL {
        Constants.baseURL
    }
    
    public var path: String {
        "/json/v1/1/lookup.php"
    }
    
    public var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "i", value: id)]
    }
    
    public var method: BitHealthProject.HTTPMethod {
        .GET
    }
}
