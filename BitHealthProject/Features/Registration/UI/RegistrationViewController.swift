//
//  RegistrationViewController.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 18
        return view
    }()
    
    private let icon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = .tmdbIcon
        view.setCornerRadius(8)
        return view
    }()
    
    private let usernameField: UITextField = {
        let view = UITextField()
        view.setCornerRadius(8)
        view.addBorder()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLeftPaddingPoints(8)
        view.setRightPaddingPoints(8)
        view.placeholder = "Input your username"
        return view
    }()
    
    private let passwordField: UITextField = {
        let view = UITextField()
        view.setCornerRadius(8)
        view.addBorder()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLeftPaddingPoints(8)
        view.setRightPaddingPoints(8)
        view.isSecureTextEntry = true
        view.placeholder = "Input your password"
        return view
    }()
    
    private lazy var signUpButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        view.setTitle("Sign up now", for: .normal)
        view.backgroundColor = .systemBlue
        view.setCornerRadius(8)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Registration"
        setupView()
    }
    
}

extension RegistrationViewController {
    private func setupView() {
        [icon, stackView].forEach { view.addSubview($0) }
        [usernameField, passwordField, signUpButton].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            icon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            icon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            icon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            usernameField.heightAnchor.constraint(equalToConstant: 44),
            passwordField.heightAnchor.constraint(equalToConstant: 44),
            signUpButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc
    private func didTapSignUp() {
        print("go to login page")
    }
}

