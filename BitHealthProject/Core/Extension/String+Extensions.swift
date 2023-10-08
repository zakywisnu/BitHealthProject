//
//  String+Extensions.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 06/10/23.
//

import Foundation

extension String {
    
    func base64Encoded() -> String? {
        data(using: .utf8)?.base64EncodedString()
    }
    
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    
}
