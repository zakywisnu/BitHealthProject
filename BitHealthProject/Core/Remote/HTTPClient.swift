//
//  HTTPClient.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    func performRequest(_ request: URLRequest, completion: @escaping (Result) -> Void)
}
