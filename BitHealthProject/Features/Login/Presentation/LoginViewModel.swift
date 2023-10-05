//
//  LoginViewModel.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

protocol LoginViewModel {
    var routeToRegis: (() -> Void)? { get }
    
    init(routeToRegis: @escaping () -> Void)
}

final class LoginViewModelDefault: LoginViewModel {
    
    var routeToRegis: (() -> Void)?
    
    init(routeToRegis: @escaping () -> Void) {
        self.routeToRegis = routeToRegis
    }
    
}
