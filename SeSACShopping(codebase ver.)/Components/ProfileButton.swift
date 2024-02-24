//
//  ProfileButton.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/29.
//

import UIKit

class ProfileButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        backgroundColor = .lightGray
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.bounds.width/2
        }
        clipsToBounds = true
        imageView?.image = UIImage(resource: .profile1)
    }
    
}
