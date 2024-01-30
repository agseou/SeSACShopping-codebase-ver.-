//
//  UIButton+Extension.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/29.
//

import UIKit

extension UIButton {
    
    func highlightBorderStyle() {
        self.layer.borderColor = UIColor.accent.cgColor
        self.layer.borderWidth = 5
    }
    
}
