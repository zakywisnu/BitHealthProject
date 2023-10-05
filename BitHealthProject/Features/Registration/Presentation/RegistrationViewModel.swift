//
//  RegistrationViewModel.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

public protocol RegistrationViewModel {
    func onTapRegis(username: String, password: String)
    var passwordErrorText: String? { get }
    
    init(onSuccessRegis: @escaping () -> Void)
}

public final class RegistrationViewModelDefault: RegistrationViewModel {
    private var onSuccessRegis: (() -> Void)?
    private let userDefaults = UserDefaults.standard
    
    public init(onSuccessRegis: @escaping () -> Void) {
        self.onSuccessRegis = onSuccessRegis
    }
    
    public func onTapRegis(username: String, password: String) {
        if userDefaults.string(forKey: username) != nil {
            
        }
        onSuccessRegis?()
    }
    
    private(set) public var passwordErrorText: String?
}
