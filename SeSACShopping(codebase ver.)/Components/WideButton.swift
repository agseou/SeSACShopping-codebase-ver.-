//
//  WideButton.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/29.
//

import UIKit

class WideButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        backgroundColor = .accent
        layer.cornerRadius = 10
        setTitleColor(.white ,for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 17)
    }
    
}
