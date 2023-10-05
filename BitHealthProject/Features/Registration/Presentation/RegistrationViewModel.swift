//
//  RegistrationViewModel.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

protocol RegistrationViewModel {
    func onTapRegis(username: String, password: String)
    
    init(onSuccessRegis: @escaping () -> Void)
}

final class RegistrationViewModelDefault: RegistrationViewModel {
    private var onSuccessRegis: (() -> Void)?
    
    init(onSuccessRegis: @escaping () -> Void) {
        self.onSuccessRegis = onSuccessRegis
    }
    
    func onTapRegis(username: String, password: String) {
        onSuccessRegis?()
    }
}
