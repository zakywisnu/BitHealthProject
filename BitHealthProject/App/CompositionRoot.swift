//
//  CompositionRoot.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import UIKit

final class CompositionRoot {
    private init () {}
    
    static func composeRoot() -> UIViewController {
        if UserDefaults.standard.get(.loggedInUser) != nil {
            return UIViewController()
        }
        return showLogin()
    }
    
    static func showLogin() -> LoginViewController {
        return LoginComposer.composeLogin()
    }
    
    static func showRegistration() -> RegistrationViewController {
        return RegistrationComposer.composeRegistration()
    }
}
