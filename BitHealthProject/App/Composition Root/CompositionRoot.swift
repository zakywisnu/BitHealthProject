//
//  CompositionRoot.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import UIKit
import Alamofire

final class CompositionRoot {
    
    private let navigationController: UINavigationController
    
    private lazy var httpClient: HTTPClient = {
        return AlamofireHTTPClient(session: Session(configuration: .ephemeral))
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func composeRoot() -> UINavigationController {
        if UserDefaults.standard.get(.loggedInUser) != nil {
            showMeals()
        } else {
            showLogin()
        }
        return navigationController
    }
    
    func showLogin() {
        let vc = LoginComposer.composeLogin(routeHandler: handleLoginRoute)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    private func handleLoginRoute(_ route: LoginRoute) {
        if route == .meals {
            showMeals()
        } else {
            showRegistration()
        }
    }
    
    func showRegistration() {
        let vc = RegistrationComposer.composeRegistration(successRegis: navigateBack)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showMeals() {
        let vc = MealsComposer.composeMeals(httpClient: httpClient, routeToDetail: showDetails(id:))
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func showDetails(id: String) {
        let vc = DetailMealsComposer.composeDetails(httpClient: httpClient, id: id)
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func navigateBack() {
        navigationController.popViewController(animated: true)
    }
}
