//
//  AlamofireHTTPClient.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation
import Alamofire

public final class AlamofireHTTPClient: HTTPClient {
    private let session: Session
    
    public init(session: Session) {
        self.session = session
    }
    
    private struct UnexpectedValuesRepresentation: Error {}
    
    public func performRequest(_ request: URLRequest, completion: @escaping (HTTPClient.Result) -> Void) {
        let afRequest = session.request(request)
            .responseData { response in
                completion(Result {
                    if let error = response.error {
                        throw error
                    } else if let data = response.data, let response = response.response {
                        return (data, response)
                    } else {
                        throw UnexpectedValuesRepresentation()
                    }
                })
            }
        
    }
}
