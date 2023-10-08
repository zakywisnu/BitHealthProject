//
//  RegistrationViewController.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import UIKit
import Combine

public final class RegistrationViewController: UIViewController {
    
    private let viewModel: RegistrationViewModel
    private var cancellable: Set<AnyCancellable> = .init()
    
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
    
    private lazy var signUpButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        view.setTitle("Sign up now", for: .normal)
        view.backgroundColor = .systemBlue
        view.setCornerRadius(8)
        return view
    }()
    
    public init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("coder hasn't been implemented yet")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Registration"
        setupView()
        observeErrorState()
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
            
            signUpButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc
    private func didTapSignUp() {
        viewModel.onTapRegis(username: usernameField.getText().lowercased(), password: passwordField.getText())
    }
    
    private func observeErrorState() {
        viewModel.usernameErrorText
            .receive(on: DispatchQueue.main)
            .sink { [weak usernameField] error in
                usernameField?.updateBottomLabelText(error)
            }.store(in: &cancellable)
    }
}

