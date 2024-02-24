//
//  UIButton+Extension.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/29.
//

import UIKit

extension UIView {
    
    func resetBorderStyle() {
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0
    }
    
    func highlightBorderStyle() {
        self.layer.borderColor = UIColor.accent.cgColor
        self.layer.borderWidth = 5
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.bounds.width / 2
        }
        clipsToBounds = true
    }
    
}
