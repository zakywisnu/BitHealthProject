//
//  CustomTextField.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import UIKit

class CustomTextField: UIView {
    
    private let textField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLeftPaddingPoints(8)
        view.setRightPaddingPoints(8)
        return view
    }()
    
    private let bottomLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLabel()
        return view
    }()
    
    private lazy var bottomLabelHeight = bottomLabel.heightAnchor.constraint(equalToConstant: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder hasn't been implemented yet")
    }
    
    @discardableResult
    func getText() -> String {
        textField.resignFirstResponder()
        return textField.text ?? ""
    }
}

// MARK: Private Method
extension CustomTextField {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        [textField, bottomLabel].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44),
            
            bottomLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLabel.topAnchor.constraint(equalTo: textField.bottomAnchor),
            bottomLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

// MARK: View Modifier
extension CustomTextField {
    @discardableResult
    func setFieldCornerRadius(_ radius: CGFloat) -> Self {
        textField.setCornerRadius(radius)
        return self
    }
    
    @discardableResult
    func setFieldBorder() -> Self {
        textField.addBorder()
        return self
    }
    
    @discardableResult
    func setPlaceHolder(_ text: String) -> Self {
        textField.placeholder = text
        return self
    }
    
    @discardableResult
    func isSecure(_ secure: Bool) -> Self {
        textField.isSecureTextEntry = secure
        return self
    }
    
    @discardableResult
    func setBottomLabelColor(_ color: UIColor) -> Self {
        bottomLabel.textColor = color
        return self
    }
    
    @discardableResult
    func updateBottomLabelText(_ text: String?) -> Self {
        bottomLabel.text = text ?? ""
        setHiddenLabel(text == nil)
        return self
    }
    
    @discardableResult
    func setHiddenLabel(_ isHidden: Bool) -> Self {
        bottomLabel.isHidden = isHidden
        bottomLabelHeight.constant = isHidden ? 0 : 16
        return self
    }
}
