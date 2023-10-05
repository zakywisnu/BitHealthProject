//
//  UIVIew+Border.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import UIKit

extension UIView {
    func addBorder(_ borderWidth: CGFloat = 1, _ borderColor: CGColor = UIColor.black.cgColor) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
    }
    
    func setCornerRadius(_ radius: CGFloat = 4) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        clipsToBounds = true
    }
}
