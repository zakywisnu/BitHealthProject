//
//  LoginViewController.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
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
    
    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        view.setTitle("Login", for: .normal)
        view.backgroundColor = .systemBlue
        view.setCornerRadius(8)
        return view
    }()
    
    private lazy var registrationLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLabel()
        view.text = "Don't have account? Sign up here"
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSignUp))
        view.addGestureRecognizer(tapGesture)
        view.textColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Login"
        setupView()
    }
    
}

extension LoginViewController {
    private func setupView() {
        [icon, stackView].forEach { view.addSubview($0) }
        [usernameField, passwordField, loginButton, registrationLabel].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            icon.widthAnchor.constraint(equalToConstant: 100),
            icon.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            usernameField.heightAnchor.constraint(equalToConstant: 44),
            passwordField.heightAnchor.constraint(equalToConstant: 44),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc
    private func didTapSignUp() {
        print("go to sign up")
    }
    
    @objc
    private func didTapLogin() {
        print("go to login")
    }
}
