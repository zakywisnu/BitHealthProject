//
//  APIEndpoint.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

import Foundation

public protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: Any] { get }
    var params: [String: Any] { get }
    var queryItems: [URLQueryItem]? { get }
}

extension APIEndpoint {
    public var headers: [String: Any] {
        [:]
    }
    
    public var params: [String: Any] {
        [:]
    }
    
    public var queryItems: [URLQueryItem]? {
        nil
    }
}

extension APIEndpoint {
    public func makeURLRequest() -> URLRequest {
        var url = baseURL
        
        if !path.isEmpty {
            url = url.appendingPathComponent(path)
        }
        
        if let queryItems = queryItems {
            url.append(queryItems: queryItems)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if !headers.isEmpty {
            for header in headers {
                request.addValue(header.value as! String, forHTTPHeaderField: header.key)
            }
        }
        
        if !params.isEmpty {
            let jsonData = try? JSONSerialization.data(withJSONObject: params)
            request.httpBody = jsonData
        }
        
        return request
    }
}
