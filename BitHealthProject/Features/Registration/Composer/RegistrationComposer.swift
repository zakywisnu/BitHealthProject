//
//  RegistrationComposer.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import Foundation

public final class RegistrationComposer {
    private init() {}
    
    public static func composeRegistration(successRegis: @escaping () -> Void) -> RegistrationViewController {
        let viewModel = RegistrationViewModelDefault(onSuccessRegis: successRegis)
        let vc = RegistrationViewController(viewModel: viewModel)
        
        return vc
    }
}
