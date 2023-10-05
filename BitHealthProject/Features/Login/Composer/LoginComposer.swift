//
//  LoginComposer.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import Foundation

final class LoginComposer {
    private init() {}
    
    static func composeLogin(showRegis: @escaping () -> Void) -> LoginViewController {
        let viewModel = LoginViewModelDefault(routeToRegis: showRegis)
        let vc = LoginViewController(viewModel: viewModel)
        return vc
    }
}
