//
//  LoginViewModel.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

enum LoginRoute {
    case registration
    case meals
}

protocol LoginViewModel {
    var passwordErrorText: String? { get }
    
    init(routeHandler: @escaping (LoginRoute) -> Void)
    
    func onTapLogin(username: String, password: String)
    func onTapRegis()
}

final class LoginViewModelDefault: LoginViewModel {
    
    private var routeHandler: ((LoginRoute) -> Void)
    private let userDefaults = UserDefaults.standard
    
    init(routeHandler: @escaping (LoginRoute) -> Void) {
        self.routeHandler = routeHandler
    }
    
    private(set) var passwordErrorText: String?
    
    func onTapLogin(username: String, password: String) {
        if userDefaults.string(forKey: username) == nil {
            // TODO: handle user not found
        } else if let savedUser = userDefaults.string(forKey: username) {
            if password != savedUser {
                // TODO: handle wrong password
            } else if password == savedUser {
                if let encodedString = UUID().uuidString.base64Encoded() {
                    userDefaults.set(.loggedInUser, to: encodedString)
                    routeHandler(.meals)
                }
            }
        }
    }
    
    func onTapRegis() {
        routeHandler(.registration)
    }
}
