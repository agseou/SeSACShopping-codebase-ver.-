//
//  UIButton+Extension.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/29.
//

import UIKit

extension UIButton {
    
    static func borderStyle() -> UIButton {
        let button = UIButton()
        button.layer.borderColor = UIColor.accent.cgColor
        button.layer.borderWidth = 5
        return button
    }
    
}
