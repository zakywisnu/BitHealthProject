//
//  LoginViewController.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import UIKit
import Combine

final class LoginViewController: UIViewController {
    
    private let viewModel: LoginViewModel
    private var cancellables: Set<AnyCancellable> = .init()
    
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
    
    private lazy var usernameField: CustomTextField = CustomTextField()
        .isSecure(false)
        .setBottomLabelColor(.red)
        .setFieldBorder()
        .setFieldCornerRadius(8)
        .setHiddenLabel(true)
        .setPlaceHolder("Input your username")
    
    private lazy var passwordField: CustomTextField = CustomTextField()
        .isSecure(true)
        .setBottomLabelColor(.red)
        .setFieldBorder()
        .setFieldCornerRadius(8)
        .setHiddenLabel(true)
        .setPlaceHolder("Input your password")
    
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
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder hasn't been implemented yet")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Login"
        setupView()
        observeViewModel()
    }
    
}

extension LoginViewController {
    private func setupView() {
        [icon, stackView].forEach { view.addSubview($0) }
        [usernameField, passwordField, loginButton, registrationLabel].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            icon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            icon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            icon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            loginButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc
    private func didTapSignUp() {
        viewModel.onTapRegis()
    }
    
    @objc
    private func didTapLogin() {
        viewModel.onTapLogin(username: usernameField.getText().lowercased(), password: passwordField.getText())
    }
    
    private func observeViewModel() {
        viewModel.passwordErrorText
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.passwordField.updateBottomLabelText(error)
            }.store(in: &cancellables)
        
        viewModel.usernameErrorText
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.usernameField.updateBottomLabelText(error)
            }.store(in: &cancellables)
    }
}
