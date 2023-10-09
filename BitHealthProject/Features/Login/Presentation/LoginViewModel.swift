//
//  LoginViewModel.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation
import Combine

enum LoginRoute {
    case registration
    case meals
}

protocol LoginViewModel {
    var passwordErrorText: PassthroughSubject<String?, Never> { get }
    var usernameErrorText: PassthroughSubject<String?, Never> { get }
    
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
    
    var passwordErrorText: PassthroughSubject<String?, Never> = .init()
    var usernameErrorText: PassthroughSubject<String?, Never> = .init()
    
    func onTapLogin(username: String, password: String) {
        usernameErrorText.send(nil)
        passwordErrorText.send(nil)
        
        if userDefaults.string(forKey: username) == nil {
            // TODO: handle user not found
            usernameErrorText.send("User not found")
        } else if let savedUser = userDefaults.string(forKey: username) {
            if password != savedUser {
                // TODO: handle wrong password
                passwordErrorText.send("Wrong password")
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
