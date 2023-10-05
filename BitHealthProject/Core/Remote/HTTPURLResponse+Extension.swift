//
//  HTTPURLResponse+Extension.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

public extension HTTPURLResponse {
    private static var OK_2xx: ClosedRange<Int> {
        return 200 ... 299
    }

    var isOK2xx: Bool {
        return HTTPURLResponse.OK_2xx.contains(statusCode)
    }
}
