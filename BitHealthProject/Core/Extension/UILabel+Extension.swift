//
//  UILabel+Extension.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 04/10/23.
//

import UIKit
import Foundation

extension UILabel {
    func setLabel(font: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular), color: UIColor = .black, alignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.font = font
        textColor = color
        textAlignment = alignment
        self.numberOfLines = numberOfLines
    }
}
