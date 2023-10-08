//
//  LoginComposer.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import Foundation

final class LoginComposer {
    private init() {}
    
    static func composeLogin(routeHandler: @escaping (LoginRoute) -> Void) -> LoginViewController {
        let viewModel = LoginViewModelDefault(routeHandler: routeHandler)
        let vc = LoginViewController(viewModel: viewModel)
        return vc
    }
}
