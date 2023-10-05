//
//  DefaultsKeys.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

class DefaultsKeys {}

final class DefaultsKey<T>: DefaultsKeys {
    let value: UserDefaultsKeys

    init(_ value: UserDefaultsKeys) {
        self.value = value
    }
}

extension UserDefaults {
    func get<T>(_ key: DefaultsKey<T>) -> T? {
        return object(forKey: key.value.rawValue) as? T
    }

    func set<T>(_ key: DefaultsKey<T>, to value: T) {
        set(value, forKey: key.value.rawValue)
    }
}

extension DefaultsKeys {
    static let loggedInUser = DefaultsKey<String>(.loggedInUser)
}
