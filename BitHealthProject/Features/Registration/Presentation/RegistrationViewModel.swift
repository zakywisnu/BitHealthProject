//
//  RegistrationViewModel.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation
import Combine

public protocol RegistrationViewModel {
    func onTapRegis(username: String, password: String)
    var usernameErrorText: PassthroughSubject<String?, Never> { get }
    
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
            usernameErrorText.send("Username already registered")
        } else {
            userDefaults.setValue(password, forKey: username)
            onSuccessRegis?()
        }
    }
    
    public var usernameErrorText: PassthroughSubject<String?, Never> = .init()
}
