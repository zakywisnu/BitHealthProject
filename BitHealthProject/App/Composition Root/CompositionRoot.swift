//
//  CompositionRoot.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import UIKit

final class CompositionRoot {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func composeRoot() -> UINavigationController {
        if UserDefaults.standard.get(.loggedInUser) != nil {
            navigationController.setViewControllers([UIViewController()], animated: true)
        } else {
            showLogin()
        }
        return navigationController
    }
    
    func showLogin() {
        let vc = LoginComposer.composeLogin(showRegis: showRegistration)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func showRegistration() {
        let vc = RegistrationComposer.composeRegistration()
        navigationController.pushViewController(vc, animated: true)
    }
}
